@echo on

bazel build --copt=-O3 --copt=-march=native :pip_pkg

set TMPDIR=tmp_pip_dir
mkdir -p ${TMPDIR}

cp -R bazel-bin/pip_pkg.runfiles/tensorflow_probability/tensorflow_probability "${TMPDIR}"

cp README.md ${TMPDIR}
cp setup.py ${TMPDIR}
ls

cd tmp_pip_dir

python -m pip install . --no-deps --ignore-installed -vvv

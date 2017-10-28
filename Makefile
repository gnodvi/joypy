# My make-fu style is old and tired.  I just want to have a few helper commands.

TESTDIR = ./test00

.PHONY: clean sdist test


clean:
	$(RM) -r Joypy.egg-info/ dist/ $(TESTDIR)
	find . -name '*.pyc' | xargs $(RM)

sdist:
	python ./setup.py sdist

test: sdist
	$(RM) -r $(TESTDIR)
	virtualenv $(TESTDIR)
	. $(TESTDIR)/bin/activate && \
		pip install --no-cache-dir --no-index ./dist/Joypy-0.1.tar.gz
	echo "Type: source ./test00/bin/activate"

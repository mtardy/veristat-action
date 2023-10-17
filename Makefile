BIN_FOLDER = .bin
ACT = ${BIN_FOLDER}/act

.PHONY: run
run:
	${ACT} -s GITHUB_TOKEN="$$(gh auth token)" --container-options "--privileged"

.PHONY: help
help:
	@echo 'install   - install act binary'
	@echo 'run       - run the GitHub action locally with act'
	@echo 'clean     - cleanup act binary'

.PHONY: install
install:
	curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | bash -s -- -b ${BIN_FOLDER}

.PHONY: clean
clean:
	rm -rf ./${BIN_FOLDER}

# Veristat GitHub action

This action installs [veristat](https://github.com/libbpf/veristat) in your
GitHub action environment and provides options to run it on a set of
*libbpf-compatible* BPF ELF object files.

You can run veristat directly on some files or in compare mode, for example to
see the comparative analysis of a PR's modifications.

## Usage

Run on BPF ELF objects files:

```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v4

  - name: Build BPF programs
    run: make build-bpf

  - name: Run veristat
    uses: mtardy/veristat-action@v1
    with:
      programs: "path/to/bpf/elf/objects/files/*.o"
```

Run in compare mode:

```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v4

  - name: Build BPF programs
    run: make build-bpf

  - name: Run veristat
    uses: mtardy/veristat-action@v1
    with:
      compare: true
      baseline-programs: "path/to/baseline/bpf/elf/objects/files/*.o"
      comparison-programs: "path/to/comparison/bpf/elf/objects/files/*.o"
```

See more concrete examples in the `.github/workflows` directory of this
repository.

## Inputs

| Name                  | Type    | Default          | Description                                                                                           |
| ---------             | ------  | ---------------- | ---------------------------------------------------------------------------------------------------   |
| `programs`            | String  |                  | Path to libbpf-compatible BPF ELF object files                                                        |
| `compare`             | Boolean | `false`          | Comparison mode, compare the result of the analysis between baseline-programs and comparison-programs |
| `baseline-programs`   | String  |                  | Path to baseline libbpf-compatible BPF ELF object files to run the comparative analysis on            |
| `comparison-programs` | String  |                  | Path to comparision libbpf-compatible BPF ELF object files to run the comparative analysis on         |
| `cache`               | Boolean | `true`           | Cache download and build veristat                                                                     |

## License

[Apache License 2.0](LICENSE)

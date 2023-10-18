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

## Output

You can retrieve the output in the workflow logs but also in the job summary.
Here are examples of how the results look.

<details>

<summary>Click here to see an example output of a simple run</summary>

See the [original GitHub Action summary page](https://github.com/mtardy/veristat-action/actions/runs/6560133222#summary-17817130293)

```
Processing 'bpf_alignchecker.o'...
Processing 'bpf_cgroup_mkdir.o'...
Processing 'bpf_cgroup_release.o'...
Processing 'bpf_cgroup_rmdir.o'...
Processing 'bpf_execve_bprm_commit_creds.o'...
Processing 'bpf_execve_event.o'...
Processing 'bpf_execve_event_v53.o'...
Processing 'bpf_execve_event_v61.o'...
Processing 'bpf_exit.o'...
Processing 'bpf_fork.o'...
Processing 'bpf_generic_kprobe.o'...
Processing 'bpf_generic_kprobe_v53.o'...
Processing 'bpf_generic_kprobe_v61.o'...
Processing 'bpf_generic_retkprobe.o'...
Processing 'bpf_generic_retkprobe_v53.o'...
Processing 'bpf_generic_retkprobe_v61.o'...
Processing 'bpf_generic_tracepoint.o'...
Processing 'bpf_generic_tracepoint_v53.o'...
Processing 'bpf_generic_tracepoint_v61.o'...
Processing 'bpf_generic_uprobe.o'...
Processing 'bpf_generic_uprobe_v53.o'...
Processing 'bpf_generic_uprobe_v61.o'...
Processing 'bpf_globals.o'...
Processing 'bpf_killer.o'...
Processing 'bpf_loader.o'...
Processing 'bpf_lseek.o'...
Processing 'bpf_multi_killer.o'...
Processing 'bpf_multi_kprobe_v53.o'...
Processing 'bpf_multi_kprobe_v61.o'...
Processing 'bpf_multi_retkprobe_v53.o'...
Processing 'bpf_multi_retkprobe_v61.o'...
File                            Program                        Verdict  Duration (us)   Insns  States  Peak states
------------------------------  -----------------------------  -------  -------------  ------  ------  -----------
bpf_cgroup_mkdir.o              tg_tp_cgrp_mkdir               success            801     581      24           24
bpf_cgroup_release.o            tg_tp_cgrp_release             success            688     381      13           13
bpf_cgroup_rmdir.o              tg_tp_cgrp_rmdir               success            670     381      13           13
bpf_execve_bprm_commit_creds.o  tg_kp_bprm_committing_creds    success            560     161      13           13
bpf_execve_event.o              event_execve                   success          39203   59119    3747         1487
bpf_execve_event.o              execve_send                    success            528      82       6            6
bpf_execve_event_v53.o          event_execve                   success         212523  268797   16597         8954
bpf_execve_event_v53.o          execve_send                    success            549     105       5            5
bpf_execve_event_v61.o          event_execve                   success          22882   49833    1253          580
bpf_execve_event_v61.o          execve_send                    success            538     105       5            5
bpf_exit.o                      event_exit                     success            496      94       8            8
bpf_fork.o                      event_wake_up_new_task         success            817     514      30           30
bpf_generic_kprobe.o            generic_kprobe_actions         success           6888    9859     401          242
bpf_generic_kprobe.o            generic_kprobe_event           success           1304    1103      82           82
bpf_generic_kprobe.o            generic_kprobe_filter_arg1     success           6519    8795     574          553
bpf_generic_kprobe.o            generic_kprobe_filter_arg2     success           6564    8795     574          553
bpf_generic_kprobe.o            generic_kprobe_filter_arg3     success           6544    8795     574          553
bpf_generic_kprobe.o            generic_kprobe_filter_arg4     success           6632    8795     574          553
bpf_generic_kprobe.o            generic_kprobe_filter_arg5     success           6609    8795     574          553
bpf_generic_kprobe.o            generic_kprobe_output          success            535      29       2            2
bpf_generic_kprobe.o            generic_kprobe_override        success            527      20       2            2
bpf_generic_kprobe.o            generic_kprobe_process_event0  success          19701   25993    1779         1105
bpf_generic_kprobe.o            generic_kprobe_process_event1  success          16899   21394    1490          943
bpf_generic_kprobe.o            generic_kprobe_process_event2  success          16924   21394    1490          943
bpf_generic_kprobe.o            generic_kprobe_process_event3  success          16840   21391    1490          943
bpf_generic_kprobe.o            generic_kprobe_process_event4  success          16939   21370    1493          946
bpf_generic_kprobe.o            generic_kprobe_process_filter  success          88996   77738    6029         1687
bpf_generic_kprobe_v53.o        generic_kprobe_actions         success          47053   63768    2145          421
bpf_generic_kprobe_v53.o        generic_kprobe_event           success           1286    1106      82           82
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg1     success         127009  195739    6717         2702
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg2     success         126078  195739    6717         2702
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg3     success         127349  195739    6717         2702
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg4     success         126934  195739    6717         2702
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg5     success         125132  195739    6717         2702
bpf_generic_kprobe_v53.o        generic_kprobe_output          success            715     332      25           25
bpf_generic_kprobe_v53.o        generic_kprobe_override        success            509      20       2            2
bpf_generic_kprobe_v53.o        generic_kprobe_process_event0  success         233492  284109   17886         9185
bpf_generic_kprobe_v53.o        generic_kprobe_process_event1  success         205184  263478   16162         8814
bpf_generic_kprobe_v53.o        generic_kprobe_process_event2  success         204872  263478   16162         8814
bpf_generic_kprobe_v53.o        generic_kprobe_process_event3  success         204589  263475   16162         8814
bpf_generic_kprobe_v53.o        generic_kprobe_process_event4  success         204815  262237   16120         8812
bpf_generic_kprobe_v53.o        generic_kprobe_process_filter  success         132516  166600    7263         1525
bpf_generic_kprobe_v61.o        generic_kprobe_actions         success          47065   63768    2145          421
bpf_generic_kprobe_v61.o        generic_kprobe_event           success           1304    1106      82           82
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg1     success         124587  195739    6717         2702
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg2     success         124996  195739    6717         2702
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg3     success         124269  195739    6717         2702
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg4     success         124270  195739    6717         2702
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg5     success         125444  195739    6717         2702
bpf_generic_kprobe_v61.o        generic_kprobe_output          success            733     332      25           25
bpf_generic_kprobe_v61.o        generic_kprobe_override        success            628      20       2            2
bpf_generic_kprobe_v61.o        generic_kprobe_process_event0  success          24657   60140    1359          679
bpf_generic_kprobe_v61.o        generic_kprobe_process_event1  success          25273   65729    1313          570
bpf_generic_kprobe_v61.o        generic_kprobe_process_event2  success          25301   65729    1313          570
bpf_generic_kprobe_v61.o        generic_kprobe_process_event3  success          25416   65726    1313          570
bpf_generic_kprobe_v61.o        generic_kprobe_process_event4  success          24841   64130    1268          576
bpf_generic_kprobe_v61.o        generic_kprobe_process_filter  success         133061  166600    7263         1525
bpf_generic_retkprobe.o         generic_retkprobe_event        success          24955   31392    2220         1235
bpf_generic_retkprobe_v53.o     generic_retkprobe_event        success         214817  242641   17047         8968
bpf_generic_retkprobe_v61.o     generic_retkprobe_event        success          30081   35906    2702          680
bpf_generic_tracepoint.o        generic_tracepoint_actions     success           6174    8786     383          245
bpf_generic_tracepoint.o        generic_tracepoint_arg1        success           6693    8795     574          553
bpf_generic_tracepoint.o        generic_tracepoint_arg2        success           6667    8795     574          553
bpf_generic_tracepoint.o        generic_tracepoint_arg3        success           6440    8795     574          553
bpf_generic_tracepoint.o        generic_tracepoint_arg4        success           6551    8795     574          553
bpf_generic_tracepoint.o        generic_tracepoint_arg5        success           6619    8795     574          553
bpf_generic_tracepoint.o        generic_tracepoint_event       success           3004    5040     266          265
bpf_generic_tracepoint.o        generic_tracepoint_event0      success          16806   21559    1500          915
bpf_generic_tracepoint.o        generic_tracepoint_event1      success          16813   21394    1490          943
bpf_generic_tracepoint.o        generic_tracepoint_event2      success          16602   21394    1490          943
bpf_generic_tracepoint.o        generic_tracepoint_event3      success          16885   21391    1490          943
bpf_generic_tracepoint.o        generic_tracepoint_event4      success          16935   21370    1493          946
bpf_generic_tracepoint.o        generic_tracepoint_filter      success          88818   77738    6029         1687
bpf_generic_tracepoint.o        generic_tracepoint_output      success            525      29       2            2
bpf_generic_tracepoint_v53.o    generic_tracepoint_actions     success          41806   56083    1950          429
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg1        success         129113  195739    6717         2702
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg2        success         124839  195739    6717         2702
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg3        success         125363  195739    6717         2702
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg4        success         125088  195739    6717         2702
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg5        success         127211  195739    6717         2702
bpf_generic_tracepoint_v53.o    generic_tracepoint_event       success           3134    5043     266          265
bpf_generic_tracepoint_v53.o    generic_tracepoint_event0      success         190978  222146   15520         8629
bpf_generic_tracepoint_v53.o    generic_tracepoint_event1      success         191379  222148   15520         8630
bpf_generic_tracepoint_v53.o    generic_tracepoint_event2      success         190464  222148   15520         8630
bpf_generic_tracepoint_v53.o    generic_tracepoint_event3      success         188307  222145   15520         8630
bpf_generic_tracepoint_v53.o    generic_tracepoint_event4      success         192819  222220   15517         8628
bpf_generic_tracepoint_v53.o    generic_tracepoint_filter      success         132623  166600    7263         1525
bpf_generic_tracepoint_v53.o    generic_tracepoint_output      success            723     332      25           25
bpf_generic_tracepoint_v61.o    generic_tracepoint_actions     success          42042   56083    1950          429
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg1        success         125716  195739    6717         2702
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg2        success         125797  195739    6717         2702
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg3        success         125166  195739    6717         2702
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg4        success         125859  195739    6717         2702
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg5        success         125236  195739    6717         2702
bpf_generic_tracepoint_v61.o    generic_tracepoint_event       success           2924    5043     266          265
bpf_generic_tracepoint_v61.o    generic_tracepoint_event0      success           4422    4613     341          308
bpf_generic_tracepoint_v61.o    generic_tracepoint_event1      success           4425    4605     341          309
bpf_generic_tracepoint_v61.o    generic_tracepoint_event2      success           4350    4605     341          309
bpf_generic_tracepoint_v61.o    generic_tracepoint_event3      success           4371    4602     341          309
bpf_generic_tracepoint_v61.o    generic_tracepoint_event4      success           4311    4612     341          310
bpf_generic_tracepoint_v61.o    generic_tracepoint_filter      success         133076  166600    7263         1525
bpf_generic_tracepoint_v61.o    generic_tracepoint_output      success            717     332      25           25
bpf_generic_uprobe.o            generic_uprobe_actions         success           5253    7349     323          202
bpf_generic_uprobe.o            generic_uprobe_event           success            928     546      40           40
bpf_generic_uprobe.o            generic_uprobe_filter_arg1     success           6576    8795     574          553
bpf_generic_uprobe.o            generic_uprobe_filter_arg2     success           6574    8795     574          553
bpf_generic_uprobe.o            generic_uprobe_filter_arg3     success           6560    8795     574          553
bpf_generic_uprobe.o            generic_uprobe_filter_arg4     success           6582    8795     574          553
bpf_generic_uprobe.o            generic_uprobe_filter_arg5     success           6489    8795     574          553
bpf_generic_uprobe.o            generic_uprobe_output          success            516      29       2            2
bpf_generic_uprobe.o            generic_uprobe_process_event0  success          16941   22134    1501          952
bpf_generic_uprobe.o            generic_uprobe_process_event1  success          16798   21394    1490          943
bpf_generic_uprobe.o            generic_uprobe_process_event2  success          16545   21394    1490          943
bpf_generic_uprobe.o            generic_uprobe_process_event3  success          16796   21391    1490          943
bpf_generic_uprobe.o            generic_uprobe_process_event4  success          16949   21370    1493          946
bpf_generic_uprobe.o            generic_uprobe_process_filter  success          88282   77738    6029         1687
bpf_generic_uprobe_v53.o        generic_uprobe_actions         success          39889   53164    1822          399
bpf_generic_uprobe_v53.o        generic_uprobe_event           success            926     552      40           40
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg1     success         123617  195739    6717         2702
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg2     success         124691  195739    6717         2702
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg3     success         126961  195739    6717         2702
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg4     success         127519  195739    6717         2702
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg5     success         126999  195739    6717         2702
bpf_generic_uprobe_v53.o        generic_uprobe_output          success            737     332      25           25
bpf_generic_uprobe_v53.o        generic_uprobe_process_event0  success         193021  222239   15529         8615
bpf_generic_uprobe_v53.o        generic_uprobe_process_event1  success         193196  222148   15520         8630
bpf_generic_uprobe_v53.o        generic_uprobe_process_event2  success         191930  222148   15520         8630
bpf_generic_uprobe_v53.o        generic_uprobe_process_event3  success         190125  222145   15520         8630
bpf_generic_uprobe_v53.o        generic_uprobe_process_event4  success         191376  222220   15517         8628
bpf_generic_uprobe_v53.o        generic_uprobe_process_filter  success         132581  166600    7263         1525
bpf_generic_uprobe_v61.o        generic_uprobe_actions         success          40202   53164    1822          399
bpf_generic_uprobe_v61.o        generic_uprobe_event           success            924     552      40           40
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg1     success         125298  195739    6717         2702
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg2     success         124434  195739    6717         2702
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg3     success         125910  195739    6717         2702
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg4     success         128142  195739    6717         2702
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg5     success         126862  195739    6717         2702
bpf_generic_uprobe_v61.o        generic_uprobe_output          success            709     332      25           25
bpf_generic_uprobe_v61.o        generic_uprobe_process_event0  success           4510    4606     340          312
bpf_generic_uprobe_v61.o        generic_uprobe_process_event1  success           4431    4605     341          309
bpf_generic_uprobe_v61.o        generic_uprobe_process_event2  success           4325    4605     341          309
bpf_generic_uprobe_v61.o        generic_uprobe_process_event3  success           4466    4602     341          309
bpf_generic_uprobe_v61.o        generic_uprobe_process_event4  success           4374    4612     341          310
bpf_generic_uprobe_v61.o        generic_uprobe_process_filter  success         132812  166600    7263         1525
bpf_globals.o                   read_globals_test              failure              0       0       0            0
bpf_killer.o                    killer                         success            424      33       3            3
bpf_loader.o                    loader_kprobe                  success            560     144      10           10
bpf_lseek.o                     test_lseek                     success            461      67       2            2
bpf_multi_killer.o              killer                         success            397      33       3            3
bpf_multi_kprobe_v53.o          generic_kprobe_actions         success          47513   63768    2145          421
bpf_multi_kprobe_v53.o          generic_kprobe_event           success           1295    1109      83           83
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg1     success         126626  195739    6717         2702
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg2     success         129392  195739    6717         2702
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg3     success         128975  195739    6717         2702
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg4     success         129046  195739    6717         2702
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg5     success         130185  195739    6717         2702
bpf_multi_kprobe_v53.o          generic_kprobe_output          success            727     332      25           25
bpf_multi_kprobe_v53.o          generic_kprobe_override        success            523      20       2            2
bpf_multi_kprobe_v53.o          generic_kprobe_process_event0  success         233467  284109   17886         9185
bpf_multi_kprobe_v53.o          generic_kprobe_process_event1  success         206866  263478   16162         8814
bpf_multi_kprobe_v53.o          generic_kprobe_process_event2  success         206710  263478   16162         8814
bpf_multi_kprobe_v53.o          generic_kprobe_process_event3  success         207060  263475   16162         8814
bpf_multi_kprobe_v53.o          generic_kprobe_process_event4  success         206821  262237   16120         8812
bpf_multi_kprobe_v53.o          generic_kprobe_process_filter  success         133861  166600    7263         1525
bpf_multi_kprobe_v61.o          generic_kprobe_actions         success          47887   63768    2145          421
bpf_multi_kprobe_v61.o          generic_kprobe_event           success           1304    1109      83           83
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg1     success         127556  195739    6717         2702
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg2     success         126800  195739    6717         2702
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg3     success         127157  195739    6717         2702
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg4     success         128924  195739    6717         2702
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg5     success         128841  195739    6717         2702
bpf_multi_kprobe_v61.o          generic_kprobe_output          success            718     332      25           25
bpf_multi_kprobe_v61.o          generic_kprobe_override        success            515      20       2            2
bpf_multi_kprobe_v61.o          generic_kprobe_process_event0  success          24616   60140    1359          679
bpf_multi_kprobe_v61.o          generic_kprobe_process_event1  success          25536   65729    1313          570
bpf_multi_kprobe_v61.o          generic_kprobe_process_event2  success          25609   65729    1313          570
bpf_multi_kprobe_v61.o          generic_kprobe_process_event3  success          25547   65726    1313          570
bpf_multi_kprobe_v61.o          generic_kprobe_process_event4  success          24910   64130    1268          576
bpf_multi_kprobe_v61.o          generic_kprobe_process_filter  success         133981  166600    7263         1525
bpf_multi_retkprobe_v53.o       generic_retkprobe_event        success         219137  242615   17047         8968
bpf_multi_retkprobe_v61.o       generic_retkprobe_event        success          28017   34584    2695          675
------------------------------  -----------------------------  -------  -------------  ------  ------  -----------
Done. Processed 31 files, 0 programs. Skipped 181 files, 0 programs.
```
</details>

<details>

<summary>Click here to see an example output of a comparison run</summary>

See the [original GitHub Action summary page](https://github.com/mtardy/veristat-action/actions/runs/6560133222#summary-17817130029)

```
File                            Program                        Verdict (A)  Verdict (B)  Verdict (DIFF)  Duration (us) (A)  Duration (us) (B)  Duration (us) (DIFF)  Insns (A)  Insns (B)  Insns       (DIFF)  States (A)  States (B)  States     (DIFF)  Peak states (A)  Peak states (B)  Peak states (DIFF)
------------------------------  -----------------------------  -----------  -----------  --------------  -----------------  -----------------  --------------------  ---------  ---------  ------------------  ----------  ----------  -----------------  ---------------  ---------------  ------------------
bpf_cgroup_mkdir.o              tg_tp_cgrp_mkdir               success      success      MATCH                         590                754        +164 (+27.80%)        581        581         +0 (+0.00%)          24          24        +0 (+0.00%)               24               24         +0 (+0.00%)
bpf_cgroup_release.o            tg_tp_cgrp_release             success      success      MATCH                         571                494         -77 (-13.49%)        381        381         +0 (+0.00%)          13          13        +0 (+0.00%)               13               13         +0 (+0.00%)
bpf_cgroup_rmdir.o              tg_tp_cgrp_rmdir               success      success      MATCH                         675                466        -209 (-30.96%)        381        381         +0 (+0.00%)          13          13        +0 (+0.00%)               13               13         +0 (+0.00%)
bpf_execve_bprm_commit_creds.o  tg_kp_bprm_committing_creds    success      N/A          N/A                           422                N/A                   N/A        161        N/A                 N/A          13         N/A                N/A               13              N/A                 N/A
bpf_execve_event.o              event_execve                   success      success      MATCH                       40858              38738        -2120 (-5.19%)      59119      59868       +749 (+1.27%)        3747        3725       -22 (-0.59%)             1487             1491         +4 (+0.27%)
bpf_execve_event.o              execve_send                    success      success      MATCH                         354                555        +201 (+56.78%)         82         82         +0 (+0.00%)           6           6        +0 (+0.00%)                6                6         +0 (+0.00%)
bpf_execve_event_v53.o          event_execve                   success      success      MATCH                      227459             231704        +4245 (+1.87%)     268797     270063      +1266 (+0.47%)       16597       16560       -37 (-0.22%)             8954             8944        -10 (-0.11%)
bpf_execve_event_v53.o          execve_send                    success      success      MATCH                         436                434           -2 (-0.46%)        105        105         +0 (+0.00%)           5           5        +0 (+0.00%)                5                5         +0 (+0.00%)
bpf_execve_event_v61.o          event_execve                   success      success      MATCH                       25519              22116       -3403 (-13.34%)      49833      40034     -9799 (-19.66%)        1253        1162       -91 (-7.26%)              580              607        +27 (+4.66%)
bpf_execve_event_v61.o          execve_send                    success      success      MATCH                         451                438          -13 (-2.88%)        105        105         +0 (+0.00%)           5           5        +0 (+0.00%)                5                5         +0 (+0.00%)
bpf_exit.o                      event_exit                     success      success      MATCH                         311                287          -24 (-7.72%)         94        112       +18 (+19.15%)           8           9       +1 (+12.50%)                8                9        +1 (+12.50%)
bpf_fork.o                      event_wake_up_new_task         success      success      MATCH                         635               1628       +993 (+156.38%)        514       1643    +1129 (+219.65%)          30         114     +84 (+280.00%)               30              114      +84 (+280.00%)
bpf_generic_kprobe.o            generic_kprobe_actions         success      success      MATCH                        7769               5097       -2672 (-34.39%)       9859       7811     -2048 (-20.77%)         401         310      -91 (-22.69%)              242              191       -51 (-21.07%)
bpf_generic_kprobe.o            generic_kprobe_event           success      success      MATCH                        1247                992        -255 (-20.45%)       1103        891      -212 (-19.22%)          82          63      -19 (-23.17%)               82               63       -19 (-23.17%)
bpf_generic_kprobe.o            generic_kprobe_filter_arg1     success      success      MATCH                        7343               7420          +77 (+1.05%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_kprobe.o            generic_kprobe_filter_arg2     success      success      MATCH                        8338               7472        -866 (-10.39%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_kprobe.o            generic_kprobe_filter_arg3     success      success      MATCH                        7941               9079       +1138 (+14.33%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_kprobe.o            generic_kprobe_filter_arg4     success      success      MATCH                        7582               7215         -367 (-4.84%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_kprobe.o            generic_kprobe_filter_arg5     success      success      MATCH                        7573               7583          +10 (+0.13%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_kprobe.o            generic_kprobe_output          success      success      MATCH                         532                615         +83 (+15.60%)         29         29         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_kprobe.o            generic_kprobe_override        success      success      MATCH                         529                435         -94 (-17.77%)         20         20         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_kprobe.o            generic_kprobe_process_event0  success      success      MATCH                       21093              19443        -1650 (-7.82%)      25993      24683      -1310 (-5.04%)        1779        1759       -20 (-1.12%)             1105             1087        -18 (-1.63%)
bpf_generic_kprobe.o            generic_kprobe_process_event1  success      success      MATCH                       25664              16826       -8838 (-34.44%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_kprobe.o            generic_kprobe_process_event2  success      success      MATCH                       16987              17223         +236 (+1.39%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_kprobe.o            generic_kprobe_process_event3  success      success      MATCH                       17502              16794         -708 (-4.05%)      21391      21434        +43 (+0.20%)        1490        1503       +13 (+0.87%)              943              913        -30 (-3.18%)
bpf_generic_kprobe.o            generic_kprobe_process_event4  success      success      MATCH                       18538              17921         -617 (-3.33%)      21370      20912       -458 (-2.14%)        1493        1486        -7 (-0.47%)              946              907        -39 (-4.12%)
bpf_generic_kprobe.o            generic_kprobe_process_filter  success      success      MATCH                      108690              91009      -17681 (-16.27%)      77738      77738         +0 (+0.00%)        6029        6029        +0 (+0.00%)             1687             1687         +0 (+0.00%)
bpf_generic_kprobe_v53.o        generic_kprobe_actions         success      success      MATCH                       54557              22590      -31967 (-58.59%)      63768      31576    -32192 (-50.48%)        2145        1099    -1046 (-48.76%)              421              331       -90 (-21.38%)
bpf_generic_kprobe_v53.o        generic_kprobe_event           success      success      MATCH                        1620               1062        -558 (-34.44%)       1106        894      -212 (-19.17%)          82          63      -19 (-23.17%)               82               63       -19 (-23.17%)
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg1     success      success      MATCH                      127829             824221    +696392 (+544.78%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg2     success      success      MATCH                      136799             807874    +671075 (+490.56%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg3     success      success      MATCH                      133286             802591    +669305 (+502.16%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg4     success      success      MATCH                      141793             796531    +654738 (+461.76%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v53.o        generic_kprobe_filter_arg5     success      success      MATCH                      132731             825804    +693073 (+522.16%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v53.o        generic_kprobe_output          success      success      MATCH                         648                648           +0 (+0.00%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_kprobe_v53.o        generic_kprobe_override        success      success      MATCH                         642                468        -174 (-27.10%)         20         20         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_event0  success      success      MATCH                      269066             241063      -28003 (-10.41%)     284109     283523       -586 (-0.21%)       17886       17883        -3 (-0.02%)             9185             9181         -4 (-0.04%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_event1  success      success      MATCH                      217012             215651        -1361 (-0.63%)     263478     261064      -2414 (-0.92%)       16162       16126       -36 (-0.22%)             8814             8779        -35 (-0.40%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_event2  success      success      MATCH                      228078             227807         -271 (-0.12%)     263478     261064      -2414 (-0.92%)       16162       16126       -36 (-0.22%)             8814             8779        -35 (-0.40%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_event3  success      success      MATCH                      212365             227430       +15065 (+7.09%)     263475     261064      -2411 (-0.92%)       16162       16125       -37 (-0.23%)             8814             8778        -36 (-0.41%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_event4  success      success      MATCH                      236393             218973       -17420 (-7.37%)     262237     261043      -1194 (-0.46%)       16120       16123        +3 (+0.02%)             8812             8776        -36 (-0.41%)
bpf_generic_kprobe_v53.o        generic_kprobe_process_filter  success      success      MATCH                      141963             150352        +8389 (+5.91%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_generic_kprobe_v61.o        generic_kprobe_actions         success      success      MATCH                       61165              24553      -36612 (-59.86%)      63768      31576    -32192 (-50.48%)        2145        1099    -1046 (-48.76%)              421              331       -90 (-21.38%)
bpf_generic_kprobe_v61.o        generic_kprobe_event           success      success      MATCH                        1205               1099         -106 (-8.80%)       1106        894      -212 (-19.17%)          82          63      -19 (-23.17%)               82               63       -19 (-23.17%)
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg1     success      success      MATCH                      138510             808567    +670057 (+483.76%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg2     success      success      MATCH                      130099             813425    +683326 (+525.24%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg3     success      success      MATCH                      145605             798069    +652464 (+448.11%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg4     success      success      MATCH                      149549             772884    +623335 (+416.81%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v61.o        generic_kprobe_filter_arg5     success      success      MATCH                      149242             802245    +653003 (+437.55%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_kprobe_v61.o        generic_kprobe_output          success      success      MATCH                         759                865        +106 (+13.97%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_kprobe_v61.o        generic_kprobe_override        success      success      MATCH                         479                535         +56 (+11.69%)         20         20         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_event0  success      success      MATCH                       26829              27048         +219 (+0.82%)      60140      60728       +588 (+0.98%)        1359        1361        +2 (+0.15%)              679              671         -8 (-1.18%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_event1  success      success      MATCH                       26466              23332       -3134 (-11.84%)      65729      57994     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_event2  success      success      MATCH                       28340              25100       -3240 (-11.43%)      65729      57994     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_event3  success      success      MATCH                       28992              22012       -6980 (-24.08%)      65726      57991     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_event4  success      success      MATCH                       28596              24193       -4403 (-15.40%)      64130      57988      -6142 (-9.58%)        1268        1217       -51 (-4.02%)              576              546        -30 (-5.21%)
bpf_generic_kprobe_v61.o        generic_kprobe_process_filter  success      success      MATCH                      152048             144217        -7831 (-5.15%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_generic_retkprobe.o         generic_retkprobe_event        success      success      MATCH                       26892              25811        -1081 (-4.02%)      31392      31146       -246 (-0.78%)        2220        2218        -2 (-0.09%)             1235             1228         -7 (-0.57%)
bpf_generic_retkprobe_v53.o     generic_retkprobe_event        success      success      MATCH                      257831             225741      -32090 (-12.45%)     242641     242356       -285 (-0.12%)       17047       17039        -8 (-0.05%)             8968             8966         -2 (-0.02%)
bpf_generic_retkprobe_v61.o     generic_retkprobe_event        success      success      MATCH                       36115              31119       -4996 (-13.83%)      35906      35573       -333 (-0.93%)        2702        2689       -13 (-0.48%)              680              667        -13 (-1.91%)
bpf_generic_tracepoint.o        generic_tracepoint_actions     success      success      MATCH                        6512               4598       -1914 (-29.39%)       8786       6702     -2084 (-23.72%)         383         262     -121 (-31.59%)              245              186       -59 (-24.08%)
bpf_generic_tracepoint.o        generic_tracepoint_arg1        success      success      MATCH                        7796               7849          +53 (+0.68%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_tracepoint.o        generic_tracepoint_arg2        success      success      MATCH                        7752               7292         -460 (-5.93%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_tracepoint.o        generic_tracepoint_arg3        success      success      MATCH                        7397               7781         +384 (+5.19%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_tracepoint.o        generic_tracepoint_arg4        success      success      MATCH                        7394               7198         -196 (-2.65%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_tracepoint.o        generic_tracepoint_arg5        success      success      MATCH                        8194               7379         -815 (-9.95%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_tracepoint.o        generic_tracepoint_event       success      success      MATCH                        3117               2673        -444 (-14.24%)       5040       4777       -263 (-5.22%)         266         247       -19 (-7.14%)              265              247        -18 (-6.79%)
bpf_generic_tracepoint.o        generic_tracepoint_event0      success      success      MATCH                       16800              16136         -664 (-3.95%)      21559      21431       -128 (-0.59%)        1500        1503        +3 (+0.20%)              915              913         -2 (-0.22%)
bpf_generic_tracepoint.o        generic_tracepoint_event1      success      success      MATCH                       17592              18071         +479 (+2.72%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_tracepoint.o        generic_tracepoint_event2      success      success      MATCH                       16629              15528        -1101 (-6.62%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_tracepoint.o        generic_tracepoint_event3      success      success      MATCH                       19751              17325       -2426 (-12.28%)      21391      21434        +43 (+0.20%)        1490        1503       +13 (+0.87%)              943              913        -30 (-3.18%)
bpf_generic_tracepoint.o        generic_tracepoint_event4      success      success      MATCH                       20882              16403       -4479 (-21.45%)      21370      20912       -458 (-2.14%)        1493        1486        -7 (-0.47%)              946              907        -39 (-4.12%)
bpf_generic_tracepoint.o        generic_tracepoint_filter      success      success      MATCH                      102357              91028      -11329 (-11.07%)      77738      77738         +0 (+0.00%)        6029        6029        +0 (+0.00%)             1687             1687         +0 (+0.00%)
bpf_generic_tracepoint.o        generic_tracepoint_output      success      success      MATCH                         537                487          -50 (-9.31%)         29         29         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_actions     success      success      MATCH                       52894              19353      -33541 (-63.41%)      56083      27638    -28445 (-50.72%)        1950         953     -997 (-51.13%)              429              300      -129 (-30.07%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg1        success      success      MATCH                      133290             822631    +689341 (+517.17%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg2        success      success      MATCH                      135055             826486    +691431 (+511.96%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg3        success      success      MATCH                      130367             827365    +696998 (+534.64%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg4        success      success      MATCH                      134541             832385    +697844 (+518.69%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_arg5        success      success      MATCH                      132817             819353    +686536 (+516.90%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event       success      success      MATCH                        3591               3143        -448 (-12.48%)       5043       4780       -263 (-5.22%)         266         247       -19 (-7.14%)              265              247        -18 (-6.79%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event0      success      success      MATCH                      199844             204640        +4796 (+2.40%)     222146     221922       -224 (-0.10%)       15520       15507       -13 (-0.08%)             8629             8599        -30 (-0.35%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event1      success      success      MATCH                      199335             196160        -3175 (-1.59%)     222148     221924       -224 (-0.10%)       15520       15509       -11 (-0.07%)             8630             8601        -29 (-0.34%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event2      success      success      MATCH                      200635             202557        +1922 (+0.96%)     222148     221924       -224 (-0.10%)       15520       15509       -11 (-0.07%)             8630             8601        -29 (-0.34%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event3      success      success      MATCH                      210483             200341       -10142 (-4.82%)     222145     221924       -221 (-0.10%)       15520       15508       -12 (-0.08%)             8630             8600        -30 (-0.35%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_event4      success      success      MATCH                      220332             201665       -18667 (-8.47%)     222220     221903       -317 (-0.14%)       15517       15506       -11 (-0.07%)             8628             8598        -30 (-0.35%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_filter      success      success      MATCH                      157801             136652      -21149 (-13.40%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_generic_tracepoint_v53.o    generic_tracepoint_output      success      success      MATCH                         641                746        +105 (+16.38%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_actions     success      success      MATCH                       44564              19498      -25066 (-56.25%)      56083      27638    -28445 (-50.72%)        1950         953     -997 (-51.13%)              429              300      -129 (-30.07%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg1        success      success      MATCH                      127710             823535    +695825 (+544.85%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg2        success      success      MATCH                      133930             818631    +684701 (+511.24%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg3        success      success      MATCH                      143448             804662    +661214 (+460.94%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg4        success      success      MATCH                      126617             814430    +687813 (+543.22%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_arg5        success      success      MATCH                      131970             816764    +684794 (+518.90%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event       success      success      MATCH                        3162               3181          +19 (+0.60%)       5043       4780       -263 (-5.22%)         266         247       -19 (-7.14%)              265              247        -18 (-6.79%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event0      success      success      MATCH                        6804               4548       -2256 (-33.16%)       4613       4347       -266 (-5.77%)         341         330       -11 (-3.23%)              308              303         -5 (-1.62%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event1      success      success      MATCH                        4608               4144        -464 (-10.07%)       4605       4349       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event2      success      success      MATCH                        6384               3869       -2515 (-39.40%)       4605       4349       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event3      success      success      MATCH                        4866               4620         -246 (-5.06%)       4602       4346       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_event4      success      success      MATCH                        4754               4364         -390 (-8.20%)       4612       4329       -283 (-6.14%)         341         326       -15 (-4.40%)              310              297        -13 (-4.19%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_filter      success      success      MATCH                      136459             138652        +2193 (+1.61%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_generic_tracepoint_v61.o    generic_tracepoint_output      success      success      MATCH                        1061                794        -267 (-25.16%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_uprobe.o            generic_uprobe_actions         success      success      MATCH                       10801               4794       -6007 (-55.62%)       7349       6702       -647 (-8.80%)         323         262      -61 (-18.89%)              202              186        -16 (-7.92%)
bpf_generic_uprobe.o            generic_uprobe_event           success      success      MATCH                         825               1219        +394 (+47.76%)        546        546         +0 (+0.00%)          40          40        +0 (+0.00%)               40               40         +0 (+0.00%)
bpf_generic_uprobe.o            generic_uprobe_filter_arg1     success      success      MATCH                        7361               7304          -57 (-0.77%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_uprobe.o            generic_uprobe_filter_arg2     success      success      MATCH                        7176               7670         +494 (+6.88%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_uprobe.o            generic_uprobe_filter_arg3     success      success      MATCH                       10450               7311       -3139 (-30.04%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_uprobe.o            generic_uprobe_filter_arg4     success      success      MATCH                        7008               9232       +2224 (+31.74%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_uprobe.o            generic_uprobe_filter_arg5     success      success      MATCH                        7372               7584         +212 (+2.88%)       8795       9103       +308 (+3.50%)         574         586       +12 (+2.09%)              553              582        +29 (+5.24%)
bpf_generic_uprobe.o            generic_uprobe_output          success      success      MATCH                         676                610          -66 (-9.76%)         29         29         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_generic_uprobe.o            generic_uprobe_process_event0  success      success      MATCH                       18447              19705        +1258 (+6.82%)      22134      21025      -1109 (-5.01%)        1501        1490       -11 (-0.73%)              952              910        -42 (-4.41%)
bpf_generic_uprobe.o            generic_uprobe_process_event1  success      success      MATCH                       16854              17501         +647 (+3.84%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_uprobe.o            generic_uprobe_process_event2  success      success      MATCH                       16944              17601         +657 (+3.88%)      21394      21434        +40 (+0.19%)        1490        1504       +14 (+0.94%)              943              914        -29 (-3.08%)
bpf_generic_uprobe.o            generic_uprobe_process_event3  success      success      MATCH                       19992              18163        -1829 (-9.15%)      21391      21434        +43 (+0.20%)        1490        1503       +13 (+0.87%)              943              913        -30 (-3.18%)
bpf_generic_uprobe.o            generic_uprobe_process_event4  success      success      MATCH                       26150              15750      -10400 (-39.77%)      21370      20912       -458 (-2.14%)        1493        1486        -7 (-0.47%)              946              907        -39 (-4.12%)
bpf_generic_uprobe.o            generic_uprobe_process_filter  success      success      MATCH                      105395              91748      -13647 (-12.95%)      77738      77738         +0 (+0.00%)        6029        6029        +0 (+0.00%)             1687             1687         +0 (+0.00%)
bpf_generic_uprobe_v53.o        generic_uprobe_actions         success      success      MATCH                       44133              18543      -25590 (-57.98%)      53164      27638    -25526 (-48.01%)        1822         953     -869 (-47.69%)              399              300       -99 (-24.81%)
bpf_generic_uprobe_v53.o        generic_uprobe_event           success      success      MATCH                         855                980        +125 (+14.62%)        552        552         +0 (+0.00%)          40          40        +0 (+0.00%)               40               40         +0 (+0.00%)
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg1     success      success      MATCH                      135888             819316    +683428 (+502.93%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg2     success      success      MATCH                      135914             816847    +680933 (+501.00%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg3     success      success      MATCH                      132093             794805    +662712 (+501.70%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg4     success      success      MATCH                      137741             801923    +664182 (+482.20%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v53.o        generic_uprobe_filter_arg5     success      success      MATCH                      135862             817659    +681797 (+501.83%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v53.o        generic_uprobe_output          success      success      MATCH                         724                764          +40 (+5.52%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_event0  success      success      MATCH                      199947             214101       +14154 (+7.08%)     222239     221802       -437 (-0.20%)       15529       15500       -29 (-0.19%)             8615             8683        +68 (+0.79%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_event1  success      success      MATCH                      205707             209379        +3672 (+1.79%)     222148     221924       -224 (-0.10%)       15520       15509       -11 (-0.07%)             8630             8601        -29 (-0.34%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_event2  success      success      MATCH                      205834             207185        +1351 (+0.66%)     222148     221924       -224 (-0.10%)       15520       15509       -11 (-0.07%)             8630             8601        -29 (-0.34%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_event3  success      success      MATCH                      206891             202143        -4748 (-2.29%)     222145     221924       -221 (-0.10%)       15520       15508       -12 (-0.08%)             8630             8600        -30 (-0.35%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_event4  success      success      MATCH                      208620             197369       -11251 (-5.39%)     222220     221903       -317 (-0.14%)       15517       15506       -11 (-0.07%)             8628             8598        -30 (-0.35%)
bpf_generic_uprobe_v53.o        generic_uprobe_process_filter  success      success      MATCH                      148642             139161        -9481 (-6.38%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_generic_uprobe_v61.o        generic_uprobe_actions         success      success      MATCH                       48834              18447      -30387 (-62.23%)      53164      27638    -25526 (-48.01%)        1822         953     -869 (-47.69%)              399              300       -99 (-24.81%)
bpf_generic_uprobe_v61.o        generic_uprobe_event           success      success      MATCH                        1018               1081          +63 (+6.19%)        552        552         +0 (+0.00%)          40          40        +0 (+0.00%)               40               40         +0 (+0.00%)
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg1     success      success      MATCH                      145857             825282    +679425 (+465.82%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg2     success      success      MATCH                      133664             807889    +674225 (+504.42%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg3     success      success      MATCH                      132672             806543    +673871 (+507.92%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg4     success      success      MATCH                      140491             813627    +673136 (+479.13%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v61.o        generic_uprobe_filter_arg5     success      success      MATCH                      135405             805334    +669929 (+494.76%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_generic_uprobe_v61.o        generic_uprobe_output          success      success      MATCH                         621                824        +203 (+32.69%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_event0  success      success      MATCH                        4410               4399          -11 (-0.25%)       4606       4354       -252 (-5.47%)         340         329       -11 (-3.24%)              312              298        -14 (-4.49%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_event1  success      success      MATCH                        5229               4417        -812 (-15.53%)       4605       4349       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_event2  success      success      MATCH                        4961               4321        -640 (-12.90%)       4605       4349       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_event3  success      success      MATCH                        4122               5450       +1328 (+32.22%)       4602       4346       -256 (-5.56%)         341         330       -11 (-3.23%)              309              303         -6 (-1.94%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_event4  success      success      MATCH                        4728               3986        -742 (-15.69%)       4612       4329       -283 (-6.14%)         341         326       -15 (-4.40%)              310              297        -13 (-4.19%)
bpf_generic_uprobe_v61.o        generic_uprobe_process_filter  success      success      MATCH                      138210             142120        +3910 (+2.83%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_globals.o                   read_globals_test              failure      failure      MATCH                           0                  0           +0 (+0.00%)          0          0         +0 (+0.00%)           0           0        +0 (+0.00%)                0                0         +0 (+0.00%)
bpf_killer.o                    killer                         success      N/A          N/A                           488                N/A                   N/A         33        N/A                 N/A           3         N/A                N/A                3              N/A                 N/A
bpf_loader.o                    loader_kprobe                  success      success      MATCH                         497                500           +3 (+0.60%)        144        144         +0 (+0.00%)          10          10        +0 (+0.00%)               10               10         +0 (+0.00%)
bpf_lseek.o                     test_lseek                     success      success      MATCH                         366                212        -154 (-42.08%)         67         67         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_multi_killer.o              killer                         success      N/A          N/A                           210                N/A                   N/A         33        N/A                 N/A           3         N/A                N/A                3              N/A                 N/A
bpf_multi_kprobe_v53.o          generic_kprobe_actions         success      success      MATCH                       53928              24514      -29414 (-54.54%)      63768      31576    -32192 (-50.48%)        2145        1099    -1046 (-48.76%)              421              331       -90 (-21.38%)
bpf_multi_kprobe_v53.o          generic_kprobe_event           success      success      MATCH                        2253               1077       -1176 (-52.20%)       1109        894      -215 (-19.39%)          83          64      -19 (-22.89%)               83               64       -19 (-22.89%)
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg1     success      success      MATCH                      140491             812915    +672424 (+478.62%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg2     success      success      MATCH                      134103             799446    +665343 (+496.14%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg3     success      success      MATCH                      130498             817853    +687355 (+526.72%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg4     success      success      MATCH                      133603             805694    +672091 (+503.05%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v53.o          generic_kprobe_filter_arg5     success      success      MATCH                      128890             836641    +707751 (+549.11%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v53.o          generic_kprobe_output          success      success      MATCH                         776                786          +10 (+1.29%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_multi_kprobe_v53.o          generic_kprobe_override        success      success      MATCH                         503                477          -26 (-5.17%)         20         20         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_event0  success      success      MATCH                      244457             246895        +2438 (+1.00%)     284109     283523       -586 (-0.21%)       17886       17883        -3 (-0.02%)             9185             9181         -4 (-0.04%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_event1  success      success      MATCH                      222274             216673        -5601 (-2.52%)     263478     261064      -2414 (-0.92%)       16162       16126       -36 (-0.22%)             8814             8779        -35 (-0.40%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_event2  success      success      MATCH                      225716             222316        -3400 (-1.51%)     263478     261064      -2414 (-0.92%)       16162       16126       -36 (-0.22%)             8814             8779        -35 (-0.40%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_event3  success      success      MATCH                      218379             213138        -5241 (-2.40%)     263475     261064      -2411 (-0.92%)       16162       16125       -37 (-0.23%)             8814             8778        -36 (-0.41%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_event4  success      success      MATCH                      218805             213920        -4885 (-2.23%)     262237     261043      -1194 (-0.46%)       16120       16123        +3 (+0.02%)             8812             8776        -36 (-0.41%)
bpf_multi_kprobe_v53.o          generic_kprobe_process_filter  success      success      MATCH                      131887             145988      +14101 (+10.69%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_multi_kprobe_v61.o          generic_kprobe_actions         success      success      MATCH                       51553              21596      -29957 (-58.11%)      63768      31576    -32192 (-50.48%)        2145        1099    -1046 (-48.76%)              421              331       -90 (-21.38%)
bpf_multi_kprobe_v61.o          generic_kprobe_event           success      success      MATCH                        2029               1252        -777 (-38.29%)       1109        894      -215 (-19.39%)          83          64      -19 (-22.89%)               83               64       -19 (-22.89%)
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg1     success      success      MATCH                      139889             820057    +680168 (+486.22%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg2     success      success      MATCH                      139198             847652    +708454 (+508.95%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg3     success      success      MATCH                      131723             797244    +665521 (+505.24%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg4     success      success      MATCH                      132452             854410    +721958 (+545.07%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v61.o          generic_kprobe_filter_arg5     success      success      MATCH                      135529             819474    +683945 (+504.65%)     195739     737400  +541661 (+276.73%)        6717       46724  +40007 (+595.61%)             2702             3540      +838 (+31.01%)
bpf_multi_kprobe_v61.o          generic_kprobe_output          success      success      MATCH                         996                734        -262 (-26.31%)        332        332         +0 (+0.00%)          25          25        +0 (+0.00%)               25               25         +0 (+0.00%)
bpf_multi_kprobe_v61.o          generic_kprobe_override        success      success      MATCH                         494                607        +113 (+22.87%)         20         20         +0 (+0.00%)           2           2        +0 (+0.00%)                2                2         +0 (+0.00%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_event0  success      success      MATCH                       29543              25654       -3889 (-13.16%)      60140      60728       +588 (+0.98%)        1359        1361        +2 (+0.15%)              679              671         -8 (-1.18%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_event1  success      success      MATCH                       30759              28602        -2157 (-7.01%)      65729      57994     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_event2  success      success      MATCH                       26846              23333       -3513 (-13.09%)      65729      57994     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_event3  success      success      MATCH                       26009              26768         +759 (+2.92%)      65726      57991     -7735 (-11.77%)        1313        1217       -96 (-7.31%)              570              546        -24 (-4.21%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_event4  success      success      MATCH                       24074              24847         +773 (+3.21%)      64130      57988      -6142 (-9.58%)        1268        1217       -51 (-4.02%)              576              546        -30 (-5.21%)
bpf_multi_kprobe_v61.o          generic_kprobe_process_filter  success      success      MATCH                      139909             163853      +23944 (+17.11%)     166600     166600         +0 (+0.00%)        7263        7263        +0 (+0.00%)             1525             1525         +0 (+0.00%)
bpf_multi_retkprobe_v53.o       generic_retkprobe_event        success      success      MATCH                      260317             240057       -20260 (-7.78%)     242615     249886      +7271 (+3.00%)       17047       17664      +617 (+3.62%)             8968             8972         +4 (+0.04%)
bpf_multi_retkprobe_v61.o       generic_retkprobe_event        success      success      MATCH                       35173              30588       -4585 (-13.04%)      34584      34071       -513 (-1.48%)        2695        2678       -17 (-0.63%)              675              660        -15 (-2.22%)
```
</details>

## License

[Apache License 2.0](LICENSE)

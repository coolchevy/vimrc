#!/usr/bin/env escript

main([Filename]) ->
    compile:file(Filename, [basic_validation, report, {i, ".."}, {i, "include"}, {i, "../include"},{i, "deps"}]).

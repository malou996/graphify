-module(sample).
-export([start/0, process/1, read_file/0, validate/1]).

-include("sample.hrl").
-include_lib("kernel/include/file.hrl").

-import(lists, [map/2, filter/2]).

start() ->
    Data = read_file(),
    Result = process(Data),
    io:format("Result: ~p~n", [Result]),
    Result.

process(Data) ->
    Valid = validate(Data),
    lists:map(fun(X) -> X * 2 end, Valid).

validate(Data) ->
    lists:filter(fun(X) -> X > 0 end, Data).

read_file() ->
    {ok, Bin} = file:read_file("input.txt"),
    binary_to_list(Bin).

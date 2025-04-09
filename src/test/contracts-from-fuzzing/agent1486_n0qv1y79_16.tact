message(777) SomeMsg {
    foo: Int;
}

contract ParamOptMsg(
    importantVal: Int,
    maybeMsg: SomeMsg?,
) {}

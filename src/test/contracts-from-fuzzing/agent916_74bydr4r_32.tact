struct Sub {
    num: Int;
}

message(77) WithStruct {
    inner: Sub;
}

contract Test(
    msg: WithStruct,
) {}
struct Inner {
    val: Int?;
    flag: Bool;
}

contract ParamContract(
    number: Int,
    inner: Inner,
    optInner: Inner?,
    message: MyMsg?,
) {}

message(0x10) MyMsg {
    data: Int;
}
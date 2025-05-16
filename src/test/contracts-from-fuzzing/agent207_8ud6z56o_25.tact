message(0x12) MsgA {
    val: Int;
    info: String?;
}

struct StructA {
    flag: Bool;
    msg: MsgA?;
    memo: String;
}

message(0x13) MsgB {
    inner: StructA;
    code: Int = 321;
}

contract TestContract {
    data: MsgB = MsgB{
        inner: StructA{
            flag: true,
            msg: null,
            memo: "hello",
        },
    };
}
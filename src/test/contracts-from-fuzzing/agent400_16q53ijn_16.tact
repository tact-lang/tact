struct ContainingMsg {
    x: Int;
    y: Bool;
}

message(0x1) MessageA {
    f: Int;
    c: ContainingMsg;
}

contract MsgInStructTest {
    field: MessageA = MessageA {
        f: 123,
        c: ContainingMsg { x: 42, y: false }
    };
    init() {}
}
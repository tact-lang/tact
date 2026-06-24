struct SInner {
    a: Int;
    b: Bool;
}

message(0x01) Msg {}

contract MsgAndStruct {
    storage: SInner;

    init() {
        self.storage = SInner { a: 100, b: true };
    }

    receive(_: Msg) {
        self.storage = SInner { a: 200, b: false };
    }
}
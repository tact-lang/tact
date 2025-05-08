message(3333) MsgA { x: Int }
message(4444) MsgB {}

struct HasMessages {
    a: MsgA;
    b: MsgB;
}

contract MsgStructPersistent {
    m: HasMessages;

    init() {
        self.m = HasMessages{
            a: MsgA{ x:7 },
            b: MsgB{}
        };
    }
}
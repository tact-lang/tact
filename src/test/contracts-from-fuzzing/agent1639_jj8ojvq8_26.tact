message Envelope {}

message InnerMsg {}

struct Holding {
    env: Envelope;
    inside: InnerMsg;
}

contract MsgStruct {
    h: Holding;

    init() {
        self.h = Holding{
            env: Envelope{},
            inside: InnerMsg{},
        };
    }
}

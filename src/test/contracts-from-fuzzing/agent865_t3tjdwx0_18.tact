// Optional field of message type with some fields
message(777) SomeMsg {
    v: Int; 
    label: String;
}

contract MsgOptContract {
    mopt: SomeMsg?;

    init() {
        self.mopt = null;
    }
}

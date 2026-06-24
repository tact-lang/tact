struct MessageStruct {
    s: String;
}

contract MessageContract {
    m: MessageStruct;

    init() {
        self.m = MessageStruct{
            s: "msg"
        };
    }
}
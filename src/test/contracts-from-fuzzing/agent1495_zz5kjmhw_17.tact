struct Payload {
    s: String;
    msg: SubMsg;
}

message(1) SubMsg {
    value: Int;
}

contract MessageInStructTest {
    payload: Payload;

    init() {
        self.payload = Payload{
            s: "hello",
            msg: SubMsg{value: 123}
        };
    }
}

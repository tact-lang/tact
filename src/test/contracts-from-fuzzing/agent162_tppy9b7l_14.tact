struct Payload {
    content: String;
    num: Int;
}

contract OptionalStructInstance {
    payload: Payload?;
    init() {
        self.payload = Payload{
            content: "hello",
            num: 123,
        };
    }
}
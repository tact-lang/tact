message(0xAAAA) Payload {
    content: String;
    num: Int as uint32;
}

contract TestContract {
    data: Payload;

    init() {
        self.data = Payload{content: "Hi", num: 77};
    }
}
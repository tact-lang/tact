struct MessageData {
    str: String;
    num: Int;
    optAddr: Address?;
}

contract MessageDataStorage {
    data: MessageData;

    init() {
        self.data = MessageData{
            str: "hello",
            num: 42,
            optAddr: null,
        };
    }
}
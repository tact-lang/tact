message(0xAA) MsgData {
    key: Int;
    flag: Bool;
}

struct Container {
    data: MsgData;
    text: String;
}

contract MessageInStorage {
    content: Container;

    init() {
        self.content = Container{
            data: MsgData{ key: 123, flag: true },
            text: "msg"
        };
    }
}

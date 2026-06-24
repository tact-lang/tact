message(0x01) MessageData {
    content: String;
    value: Int;
}

struct Wrapper {
    msg: MessageData;
    description: String;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            msg: MessageData{
                content: "MSG",
                value: 123,
            },
            description: "desc",
        };
    }
}
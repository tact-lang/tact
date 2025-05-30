message(0x1234) MsgType {
    value: Int;
    text: String;
}

struct Container {
    content: MsgType;
    flag: Bool;
}

contract TestContract {
    stuff: Container;

    init() {
        self.stuff = Container{
            content: MsgType{
                value: 42,
                text: "hello"
            },
            flag: true
        };
    }
}
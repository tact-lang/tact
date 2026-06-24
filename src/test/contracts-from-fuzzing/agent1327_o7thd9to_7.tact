message(0x42) MyMessage {
    info: String;
    number: Int as uint32;
}

struct Container {
    msg: MyMessage;
    note: String?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            msg: MyMessage{ info: "hey", number: 1000 },
            note: "optional note"
        };
    }
}
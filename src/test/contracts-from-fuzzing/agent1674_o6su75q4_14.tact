message(99) Ping {
    timestamp: Int;
}

struct Container {
    note: Ping?; // optional message, default null
    content: String;
}

contract OptionalMsgInStruct {
    data: Container;

    init() {
        self.data = Container{
            note: null,
            content: "foo",
        };
    }
}
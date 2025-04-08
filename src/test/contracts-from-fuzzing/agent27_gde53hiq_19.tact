message(0xBBB) InnerMsg {
    val: Int;
}

struct Container {
    text: String;
    inner: InnerMsg;
}

contract MsgNestedInStruct {
    data: Container;

    init() {
        self.data = Container{
            text: "test",
            inner: InnerMsg{val: 5}
        };
    }
}
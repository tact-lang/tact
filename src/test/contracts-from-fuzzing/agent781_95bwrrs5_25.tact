message(0x42) MyMsg {
    count: Int;
    tag: String;
}

contract TestContract {
    data: MyMsg;

    init() {
        self.data = MyMsg{
            count: 7,
            tag: "hi"
        };
    }
}
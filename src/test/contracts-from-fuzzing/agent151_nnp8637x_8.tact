message(0x42) MyMsg {
    x: Int;
    y: String?;
}

contract Test {
    m: MyMsg;

    init() {
        self.m = MyMsg{
            x: 77,
            y: null,
        };
    }
}
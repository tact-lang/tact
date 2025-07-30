message(1234) MyMsg {
    x: Int;
    y: Int;
}

contract TestContract {
    stored: MyMsg;

    init() {
        self.stored = MyMsg{
            x: 111,
            y: 222,
        };
    }
}
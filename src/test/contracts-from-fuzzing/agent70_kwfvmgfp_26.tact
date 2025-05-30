message(0x12345678) MyMsg {
    code: Int;
}

contract TestContract {
    optMsg: MyMsg?;

    init() {
        self.optMsg = null;
    }

    receive() {
        self.optMsg = MyMsg{ code: 42 };
    }
}
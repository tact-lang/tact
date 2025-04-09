message(1234) TestMsg {
    foo: Int = 5;
    bar: Bool = true;
}

contract TestContract {
    msgData: TestMsg? = null;

    init() {
        self.msgData = null;
    }

    receive() {
        if (self.msgData != null) {
            let _ = self.msgData!!.foo;
        }
    }
}
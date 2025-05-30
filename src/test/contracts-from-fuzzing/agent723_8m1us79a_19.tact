message(0x2) TestMsg {
    foo: Int;
}

contract TestContract {
    m: TestMsg?;

    init() {
        self.m = null;
    }

    receive() {}
}
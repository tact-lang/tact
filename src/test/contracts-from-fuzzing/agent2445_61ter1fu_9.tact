message(11) TestMsg {
    foo: Int = 1;
    bar: Bool = false;
    txt: String;
}

contract Demo {
    msg: TestMsg;

    init() {
        self.msg = TestMsg{
            txt: "hi"
        };
    }

    receive() {}
}
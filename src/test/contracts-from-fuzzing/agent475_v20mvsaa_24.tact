message(0xdeadbeef) MyMsg {
    foo: Int;
    bar: Bool;
}

contract MsgFieldTest {
    mymsg: MyMsg;

    init() {
        self.mymsg = MyMsg{ foo: 123, bar: true };
    }

    receive() {}
}
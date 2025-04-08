message(0x124) MyMsg {
    foo: Int;
}

contract MessageFieldInit {
    m: MyMsg;

    init() {
        self.m = MyMsg{ foo: 1234 };
    }
}
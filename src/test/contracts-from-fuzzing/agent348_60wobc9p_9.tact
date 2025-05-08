message(123) MyMsg {
    foo: Int;
}

contract MsgFieldContract {
    m: MyMsg;

    init() {
        self.m = MyMsg{ foo: 21 };
    }
}
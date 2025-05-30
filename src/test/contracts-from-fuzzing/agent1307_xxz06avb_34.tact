message(0x99) MyMsg {
  foo: Int = 5;
  bar: Bool = false;
}

contract MsgAsVar {
    m: MyMsg = MyMsg{};

    init() {
        self.m = MyMsg{ foo: 42, bar: true };
    }
}
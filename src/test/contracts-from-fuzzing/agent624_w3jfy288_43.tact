message(0x23) MsgWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
}

contract StoreMsgDefaults {
    m: MsgWithDefaults;

    init() {
        self.m = MsgWithDefaults{};
    }
}
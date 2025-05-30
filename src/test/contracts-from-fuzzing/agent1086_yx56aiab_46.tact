message(42) MsgWithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract MsgDefaultsContract {
    m: MsgWithDefaults;

    init() {
        self.m = MsgWithDefaults{ a:123, b:true };
    }
}
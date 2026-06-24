// Check message struct with default values inside
message(2) MsgWithDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract MessageDefaultsHolder {
    m: MsgWithDefaults;

    init() {
        self.m = MsgWithDefaults{};
    }
}

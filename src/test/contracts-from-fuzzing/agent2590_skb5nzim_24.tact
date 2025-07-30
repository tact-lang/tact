struct OptionIntBool {
    a: Int?;
    b: Bool?;
}

contract OptIntBoolContract {
    state: OptionIntBool;
    init() {
        self.state = OptionIntBool{ a: null, b: null };
    }
}
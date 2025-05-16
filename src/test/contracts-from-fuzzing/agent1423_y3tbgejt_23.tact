struct OptionalBool {
    flag: Bool?;
}

contract OptionalBoolContract {
    s: OptionalBool;
    init() {
        self.s = OptionalBool{ flag: null };
    }
}
struct OptionalBool {
    flag: Bool?;
}

contract OptionalBoolContract {
    f: OptionalBool;

    init() {
        self.f = OptionalBool{ flag: null };
    }
}

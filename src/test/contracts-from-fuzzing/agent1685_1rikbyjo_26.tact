struct OptBool {
    flag: Bool?;
}

contract OptionalFlag {
    state: OptBool;

    init() {
        self.state = OptBool{ flag: null };
    }
}

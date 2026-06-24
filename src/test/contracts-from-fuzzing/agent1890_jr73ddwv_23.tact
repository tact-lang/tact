struct OptBool {
    flag: Bool?;
}

contract OptBoolField {
    f: OptBool;

    init() {
        self.f = OptBool{ flag: null };
    }
}
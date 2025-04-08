struct OptBool {
    flag: Bool?;
}

contract OptionalBoolField {
    data: OptBool;
    init() {
        self.data = OptBool{ flag: null };
    }
}
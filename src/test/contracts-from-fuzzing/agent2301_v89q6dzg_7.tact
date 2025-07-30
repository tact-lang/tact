struct OptionalBool {
    flag: Bool?;
}

contract OptBoolInField {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{ flag: null };
    }
}
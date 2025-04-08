struct OptionalBool {
    flag: Bool?;
}

contract OptionalBoolStruct {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{ flag: true };
    }
}
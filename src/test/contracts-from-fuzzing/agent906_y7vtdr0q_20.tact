struct OptionalBool {
    flag: Bool?;
}

contract OptBoolField {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{
            flag: null
        };
    }
}
struct OptionalBool {
    flag: Bool?;
}

contract OptionalBoolean {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{
            flag: null,
        };
    }
}
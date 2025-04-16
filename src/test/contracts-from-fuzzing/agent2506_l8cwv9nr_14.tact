struct OptionalFlag {
    bit: Bool?;
}

struct ContainsOptionalBool {
    optBool: OptionalFlag;
    message: String;
}

contract OptBoolStructStorage {
    data: ContainsOptionalBool;
    init() {
        self.data = ContainsOptionalBool{
            optBool: OptionalFlag{ bit: null },
            message: "test",
        };
    }
}

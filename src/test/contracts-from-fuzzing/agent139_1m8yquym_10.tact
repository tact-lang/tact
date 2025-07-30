struct IntAndOptionalBool {
    value: Int;
    flag: Bool?;
}

contract OptBoolPersist {
    data: IntAndOptionalBool;

    init() {
        self.data = IntAndOptionalBool{
            value: 5,
            flag: null
        };
    }
}
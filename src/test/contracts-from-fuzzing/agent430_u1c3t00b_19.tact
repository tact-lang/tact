struct BoolAndOptionalBool {
    flag: Bool;
    optFlag: Bool?;
}

contract Test {
    data: BoolAndOptionalBool;

    init() {
        self.data = BoolAndOptionalBool{
            flag: true,
            optFlag: null,
        };
    }
}
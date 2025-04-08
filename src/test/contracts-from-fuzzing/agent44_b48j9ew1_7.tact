struct NestedOptional {
    v1: Int?;
    v2: Bool?;
}

contract Test {
    optStruct: NestedOptional?;

    init() {
        self.optStruct = null;
    }

    receive() {
        self.optStruct = NestedOptional{ v1: 123, v2: null };
    }
}
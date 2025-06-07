struct OptionalBoolNesting {
    a: Bool?;
}

struct OptionalInStruct {
    b: OptionalBoolNesting?;
}

contract NestedOptionalBoolStruct {
    val: OptionalInStruct;

    init() {
        self.val = OptionalInStruct{ b: null };
    }
}

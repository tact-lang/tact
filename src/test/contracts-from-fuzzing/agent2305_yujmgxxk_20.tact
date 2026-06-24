struct ComplexOne {
    inner1: Int?;
    inner2: NestedOrNull?;
}

struct NestedOrNull {
    val: Int;
    flag: Bool;
}

contract TestComplexOne {
    storage: ComplexOne;

    init() {
        self.storage = ComplexOne{
            inner1: null,
            inner2: null
        };
    }
}

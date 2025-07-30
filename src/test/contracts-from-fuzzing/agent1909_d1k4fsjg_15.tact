struct IntPair {
    a: Int;
    b: Int;
}

struct NestedWithDefaults {
    pair: IntPair;
    num: Int = 42;
    flag: Bool = false;
}

contract DefaultInNestedStructs {
    record: NestedWithDefaults;

    init() {
        self.record = NestedWithDefaults{
            pair: IntPair{ a: 1, b: 2 }
        };
    }
}
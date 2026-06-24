struct NestedOptional {
    value: Int?;
}

struct NestedMultiple {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Address;
    nestedInner: NestedOptional;
}

contract ComboStorage {
    combined: NestedMultiple;

    init() {
        self.combined = NestedMultiple{
            val1: 10,
            val2: true,
            val3: "test",
            val4: myAddress(),
            nestedInner: NestedOptional{ value: 42 }
        };
    }
}

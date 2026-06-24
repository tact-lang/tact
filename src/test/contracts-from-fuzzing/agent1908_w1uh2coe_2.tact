struct DeepNested {
    a: Int;
    b: Int?;
}

struct Wrapper {
    nested: DeepNested;
}

contract DeepNestedStorage {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{ nested: DeepNested{ a: 42, b: null } };
    }
}
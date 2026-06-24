struct DeepNested1 {
    a: Int;
}

struct DeepNested2 {
    inner: DeepNested1;
}

contract DeepNestedContract {
    nested: DeepNested2;

    init() {
        self.nested = DeepNested2{ inner: DeepNested1{ a: 5 } };
    }
}
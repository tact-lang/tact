struct DeepNested {
    level2: NestedOpt?;
}

struct NestedOpt {
    inner: Int?;
}

contract TestContract {
    value: DeepNested;

    init() {
        self.value = DeepNested{ level2: null };
    }
}
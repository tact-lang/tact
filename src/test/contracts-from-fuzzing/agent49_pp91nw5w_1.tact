struct Inner {
    flag: Bool;
    count: Int;
}

contract DeepNested {
    nested: Inner;

    init() {
        self.nested = Inner{flag: true, count: 42};
    }
}
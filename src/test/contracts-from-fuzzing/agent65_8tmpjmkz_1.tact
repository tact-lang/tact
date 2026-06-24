struct Inner {
    flag: Bool;
    number: Int;
}

contract DeepNest {
    deep: Inner;

    init() {
        self.deep = Inner{flag: true, number: 42};
    }
}
struct Inner {
    flag: Bool;
    count: Int;
}

contract InitNested {
    nested: Inner;
    deeper: Inner;

    init() {
        self.nested = Inner{flag: true, count: 1};
        self.deeper = Inner{flag: false, count: 2};
    }
}
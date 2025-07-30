struct Inner { a: Int; b: Bool; }

contract DeepPersist {
    nested: Inner;
    flag: Bool;
    count: Int;

    init() {
        self.nested = Inner{ a: 123, b: true };
        self.flag = false;
        self.count = 7;
    }
}
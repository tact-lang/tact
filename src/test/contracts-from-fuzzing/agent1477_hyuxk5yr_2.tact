struct Inner {
    f1: Int;
    f2: Bool;
}

contract StructInPersistent {
    data: Inner;

    init() {
        self.data = Inner{
            f1: 42,
            f2: true,
        };
    }
}
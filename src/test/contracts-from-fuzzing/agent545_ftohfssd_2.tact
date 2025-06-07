struct Inner {
    f1: Int;
    f2: String;
    f3: Bool?;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            f1: 42,
            f2: "nested",
            f3: null,
        };
    }

    receive() {
        // noop
    }
}
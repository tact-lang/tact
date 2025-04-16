struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedOpt: Inner? = null;

    init() {
        self.nestedOpt = Inner{
            a: 42,
            b: true,
        };
    }
}
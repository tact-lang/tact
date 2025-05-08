struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Inner? = null;

    init() {
        self.s = Inner{
            a: 10,
            b: true,
        };
    }
}
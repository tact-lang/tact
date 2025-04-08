struct Inner {
    u: Int;
    v: Bool;
    w: Int?;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{
            u: 10,
            v: false,
            w: null,
        };
    }
}
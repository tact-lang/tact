struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{
            a: 1,
            b: "test",
            c: null,
        };
    }
}
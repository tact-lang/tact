struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            a: 42,
            b: null,
            c: "opt",
        };
    }
}
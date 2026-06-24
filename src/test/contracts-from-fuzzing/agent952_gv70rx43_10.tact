struct Inner {
    a: Int?;
    b: Bool;
    c: String;
}

contract Test {
    st: Inner;

    init() {
        self.st = Inner{
            a: null,
            b: true,
            c: "hello",
        };
    }
}

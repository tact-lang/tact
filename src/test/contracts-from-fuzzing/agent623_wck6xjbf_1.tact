struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

contract Test1 {
    s: Inner;

    init() {
        self.s = Inner{
            a: 7,
            b: true,
            c: "hi",
        };
    }
}
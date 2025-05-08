struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{
            a: 42,
            b: true,
            c: "hello",
        };
    }
}
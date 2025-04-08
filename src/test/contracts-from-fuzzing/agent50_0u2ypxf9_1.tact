struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{
            a: 1,
            b: "x",
            c: true,
        };
    }
}
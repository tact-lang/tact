struct SInner {
    a: Bool;
    b: String;
    c: Int;
}

contract Test {
    s: SInner?;

    init() {
        self.s = SInner{
            a: true,
            b: "hi",
            c: 123,
        };
    }
}

struct Inner {
    d: Int;
    e: Bool;
    f: String;
}

contract Test {
    s: Inner;

    init() {
        self.s = Inner{
            d: 2,
            e: false,
            f: "nested"
        };
    }
}
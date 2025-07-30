struct Middle {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructWrap {
    s: Middle?;

    init() {
        self.s = Middle {
            a: 10,
            b: false,
            c: "hi"
        };
    }
}
struct Alternating {
    a: Int;
    b: String;
    c: Int;
    d: String;
}

contract AlternateFields {
    s: Alternating;
    init() {
        self.s = Alternating{
            a: 1,
            b: "b",
            c: 2,
            d: "d"
        };
    }
}
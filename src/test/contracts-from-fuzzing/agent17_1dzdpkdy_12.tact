struct Alternating {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract TestContract {
    alt: Alternating;

    init() {
        self.alt = Alternating{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: true,
            f: null,
        };
    }
}
struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalHeavy {
    state: ManyOptionals;
    init() {
        self.state = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: 42,
            e: null,
            f: "hi",
        };
    }
}
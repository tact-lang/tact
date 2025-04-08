struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract OptionalFields {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null,
        };
    }
}

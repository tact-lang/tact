struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Int?;
    g: Bool?;
    h: String?;
}

contract BigState {
    state: ManyFields;
    init() {
        self.state = ManyFields{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: "hello",
            f: null,
            g: null,
            h: null
        };
    }
}
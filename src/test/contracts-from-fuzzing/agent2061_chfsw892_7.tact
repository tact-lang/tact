struct Combined {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
}

contract AllKinds {
    store: Combined;

    init() {
        self.store = Combined{
            a: 77,
            b: false,
            c: "abc",
            d: true,
            e: null,
            f: null,
        };
    }
}
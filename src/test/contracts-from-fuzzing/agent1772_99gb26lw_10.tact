struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test10 {
    data: Flat;

    init() {
        self.data = Flat{
            a: 1,
            b: true,
            c: "hi",
            d: 42,
            e: null,
            f: null,
        };
    }
}
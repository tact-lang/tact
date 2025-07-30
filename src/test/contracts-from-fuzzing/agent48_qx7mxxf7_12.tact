struct Deep {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract DeepOptions {
    item: Deep;

    init() {
        self.item = Deep{
            a: 1,
            b: "b",
            c: false,
            d: null,
            e: null,
            f: null
        };
    }
}

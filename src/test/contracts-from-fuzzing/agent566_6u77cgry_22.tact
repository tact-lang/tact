struct Variations {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool;
    f: String;
}

contract ManyVariations {
    data: Variations;

    init() {
        self.data = Variations{
            a: 1,
            b: null,
            c: null,
            d: null,
            e: true,
            f: "abc"
        };
    }
}
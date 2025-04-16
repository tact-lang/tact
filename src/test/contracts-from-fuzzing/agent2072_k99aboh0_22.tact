struct Combining {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract CombiningStructures {
    val: Combining;

    init() {
        self.val = Combining{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "str",
            f: null,
        };
    }
}
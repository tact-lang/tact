struct Nested {
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool?;
    i: Int?;
}

contract StringMix {
    field: Nested;

    init() {
        self.field = Nested{
            s1: "abc",
            s2: "def",
            b1: true,
            b2: null,
            i: null
        };
    }
}

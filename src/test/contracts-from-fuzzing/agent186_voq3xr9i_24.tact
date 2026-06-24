struct NestedMany {
    s: String;
    b: Bool;
    i: Int;
    s2: String?;
    b2: Bool?;
    i2: Int?;
}

contract NestedManyTest {
    f: NestedMany;

    init() {
        self.f = NestedMany{
            s: "a",
            b: false,
            i: 1,
            s2: "b",
            b2: null,
            i2: null
        };
    }
}
struct Deep {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MultiTypeFieldsTest {
    f: Deep;

    init() {
        self.f = Deep{
            a: 1,
            b: "abc",
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}
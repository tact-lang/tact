struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract WideFieldsTest {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: "hi",
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}
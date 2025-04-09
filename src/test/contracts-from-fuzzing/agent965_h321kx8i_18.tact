struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedTest {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
        };
    }
}
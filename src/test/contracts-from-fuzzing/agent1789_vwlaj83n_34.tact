struct ManyScalars {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

contract ManyScalarsTest {
    m: ManyScalars;

    init() {
        self.m = ManyScalars{
            a: 1,
            b: true,
            c: "a",
            d: 2,
            e: false,
            f: "b"
        };
    }
}
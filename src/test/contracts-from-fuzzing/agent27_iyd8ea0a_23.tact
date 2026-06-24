struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract MixedContract {
    f: Mixed;

    init() {
        self.f = Mixed{
            a: 42,
            b: null,
            c: "x",
            d: null
        };
    }
}
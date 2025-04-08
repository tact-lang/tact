struct DefaultVals {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?; // default null for optional
    e: Bool?;
}

contract TestDefault {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{
            a: 42,
            b: true,
            c: "hello",
            d: null,
            e: null,
        };
    }
}
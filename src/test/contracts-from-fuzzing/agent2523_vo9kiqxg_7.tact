struct DefaultVals {
    a: Int = 42;
    b: Bool = true;
    c: String = "x";
    d: Int?; // default null
    e: String?; // default null
}

contract DefaultStructTest {
    field: DefaultVals;

    init() {
        self.field = DefaultVals {
            d: null,
            e: null,
        };
    }
}

struct ConsecutiveOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
}

contract ManyOpts {
    f: ConsecutiveOptionals;

    init() {
        self.f = ConsecutiveOptionals{
            a: null,
            b: null,
            c: null,
            d: 123
        };
    }
}
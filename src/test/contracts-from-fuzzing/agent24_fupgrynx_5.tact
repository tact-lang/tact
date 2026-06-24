struct Plain {
    x: Int;
}

struct Full {
    optPlain: Plain?;
    optBool: Bool?;
    optInt: Int?;
}

contract TestOptionals {
    f: Full;

    init() {
        self.f = Full{
            optPlain: null,
            optBool: false,
            optInt: 123
        };
    }
}
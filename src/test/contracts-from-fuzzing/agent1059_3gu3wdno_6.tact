struct NestedOptionals {
    xo: Int?;
    bo: Bool?;
}

struct FirstLevel {
    nestedOpt: NestedOptionals?;
    flag: Bool;
}

contract OptionalNest {
    f: FirstLevel;
    init() {
        self.f = FirstLevel{
            nestedOpt: null,
            flag: true
        };
    }
}
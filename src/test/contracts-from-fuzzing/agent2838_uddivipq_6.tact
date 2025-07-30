struct MiddleNested {
    optInt: Int?;
    boolVal: Bool;
}

struct Outer {
    middle: MiddleNested;
    optBool: Bool?;
}

contract OptionalNested {
    s: Outer;

    init() {
        self.s = Outer{
            middle: MiddleNested{ optInt: null, boolVal: true },
            optBool: null
        };
    }
}
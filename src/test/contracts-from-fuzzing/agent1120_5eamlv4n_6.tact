struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    innerOpt: Inner?;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract OptionalStructFields {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null,
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}
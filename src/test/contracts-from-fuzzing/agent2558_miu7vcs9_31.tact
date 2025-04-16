struct NestedBoolOpt {
    b1: Bool?;
    b2: Bool?;
}

struct OuterOpt {
    inner: NestedBoolOpt?;
    flag: Bool;
}

contract OptionalComplex {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: NestedBoolOpt{
                b1: true,
                b2: null
            },
            flag: false
        };
    }
}
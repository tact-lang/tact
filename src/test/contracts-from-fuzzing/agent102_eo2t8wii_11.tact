struct ComplexNested {
    s1: Bool;
    s2: Inner;
}

struct Inner {
    i1: Int;
    i2: InnerDeep;
}

struct InnerDeep {
    b: Bool?;
    s: String;
}

contract ComplexNestedStructs {
    val: ComplexNested;

    init() {
        self.val = ComplexNested{
            s1: false,
            s2: Inner{
                i1: 42,
                i2: InnerDeep{
                    b: null,
                    s: "deep"
                }
            }
        };
    }
}
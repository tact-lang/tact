struct InnerS { foo: Int; }

struct OuterS {
    bar: InnerS?;
}

contract OptionalNestedStruct {
    s: OuterS;

    init() {
        self.s = OuterS {
            bar: InnerS { foo: 42 }
        };
    }
}
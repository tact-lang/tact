struct InnerS {
    a: Int;
}

struct OuterS {
    s: InnerS?;
}

contract OptionalSubStruct {
    outer: OuterS;

    init() {
        self.outer = OuterS{
            s: null,
        };
    }
}
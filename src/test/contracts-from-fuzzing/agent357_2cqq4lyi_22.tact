struct InnerS {
    a: Int;
    b: Bool;
}

struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: InnerS?;
}

contract ComplexOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}
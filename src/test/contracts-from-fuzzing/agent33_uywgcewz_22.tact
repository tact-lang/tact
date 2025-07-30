struct NestedWithOptionals {
    i: Int;
    optInner: Inner?;
}

struct Inner {
    b: Bool;
    s: String?;
}

contract ComplexNestedOptionals {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            i: 5,
            optInner: Inner{
                b: true,
                s: null
            }
        };
    }
}
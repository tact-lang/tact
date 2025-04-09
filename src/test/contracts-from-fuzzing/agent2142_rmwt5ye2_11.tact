struct NestedOptionals {
    s1: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNesting {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            s1: Inner{
                a: null,
                b: null,
                c: null,
            },
        };
    }
}

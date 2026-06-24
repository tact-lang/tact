struct InnerMost {
    foo: Int?;
}

struct Middle {
    bar: InnerMost;
}

struct OuterMost {
    baz: Middle;
}

contract AllNullNested {
    nested: OuterMost;

    init() {
        self.nested = OuterMost{
            baz: Middle{
                bar: InnerMost{
                    foo: null,
                }
            }
        };
    }
}

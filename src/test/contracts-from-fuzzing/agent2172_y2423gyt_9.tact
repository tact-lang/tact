struct Outer {
    inners: Inners;
}

struct Inners {
    one: Inner1;
    two: Inner2;
}

struct Inner1 {
    val: Int;
}

struct Inner2 {
    nested: NestedInner;
}

struct NestedInner {
    opt: Bool?;
}

contract DeepWide {
    field: Outer;

    init() {
        self.field = Outer{
            inners: Inners{
                one: Inner1{ val: 123 },
                two: Inner2{ nested: NestedInner{ opt: null } },
            },
        };
    }
}
struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    nested: NestedOptional?;
}

contract TestContract {
    optNested: Outer;

    init() {
        self.optNested = Outer{
            nested: null
        };
    }
}
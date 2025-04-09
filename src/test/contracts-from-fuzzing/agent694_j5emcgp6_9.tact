struct NestedWithOptionals {
    foo: Int?;
    bar: Bool?;
}

struct OuterComplex {
    nested: NestedWithOptionals?;
    count: Int;
}

contract TestContract {
    complex: OuterComplex;

    init() {
        self.complex = OuterComplex{
            nested: null,
            count: 5
        };
    }
}
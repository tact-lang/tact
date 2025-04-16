struct Inner {
    field1: Int;
    field2: Bool;
}

struct Outer {
    nested: Inner;
    optionalNested: Inner?;
    number: Int;
}

contract ComplexStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{field1: 1, field2: true},
            optionalNested: null,
            number: 42
        };
    }
}
struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Outer {
    nested: NestedOptional?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedOptional{ foo: 7, bar: null, baz: "abc" }
        };
    }
}
struct ComplexOptional {
    foo: Int?;
    bar: NestedOptional?;
}

struct NestedOptional {
    baz: Bool?;
    qux: String?;
}

contract OptTest {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            foo: 10,
            bar: NestedOptional{
                baz: true,
                qux: "optional"
            }
        };
    }
}
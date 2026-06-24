struct Nested {
    foo: Int?;
    bar: Int;
    baz: String?;
}

struct Complex {
    a: Int?;
    b: Bool?;
    c: String?;
    nested: Nested?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: null,
            c: null,
            nested: Nested{
                foo: null,
                bar: 31,
                baz: null
            }
        };
    }
}
struct Complex {
    value: Int;
    flag: Bool?;
    description: String;
    sub: Nested;
}

struct Nested {
    foo: Bool;
    bar: Int?;
}

contract ComplexContract {
    data: Complex;

    init() {
        self.data = Complex{
            value: 42,
            flag: null,
            description: "desc",
            sub: Nested{
                foo: true,
                bar: null
            }
        };
    }
}

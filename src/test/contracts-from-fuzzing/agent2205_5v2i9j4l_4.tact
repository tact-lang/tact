struct Complex {
    flag: Bool = false;
    number: Int = 7;
    nested: Nested;
}

struct Nested {
    val: Int?;
}

contract ComplexStorage {
    field: Complex;

    init() {
        self.field = Complex{
            flag: true,
            number: 42,
            nested: Nested{ val: 123 }
        };
    }
}
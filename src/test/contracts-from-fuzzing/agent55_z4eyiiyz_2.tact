struct Nested {
    flag: Bool;
    number: Int;
}

struct Complex {
    nested: Nested;
    value: Int;
    text: String;
    check: Bool;
}

contract DeepStorage {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            nested: Nested{flag: false, number: 42},
            value: 1000,
            text: "Nested test",
            check: true
        };
    }
}

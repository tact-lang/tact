struct Complex {
    i: Int as int64;
    b: Bool;
    s: String?;
    nested: Nested;
}

struct Nested {
    x: Int as uint64;
    y: String;
}

contract ComplexContract {
    val: Complex;

    init() {
        self.val = Complex{
            i: -123,
            b: true,
            s: null,
            nested: Nested{
                x: 456,
                y: "inside"
            }
        };
    }
}
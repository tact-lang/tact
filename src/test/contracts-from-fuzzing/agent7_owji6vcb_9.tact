struct Complex {
    s: String;
    opt: Int?;
    nested: Nested;
}

struct Nested {
    b: Bool;
    s2: String;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{
            s: "hi",
            opt: null,
            nested: Nested{
                b: true,
                s2: "there"
            }
        };
    }
}
// Contract with both primitive fields and a nested struct
struct Nested {
    x: Int;
    y: Bool?;
}

contract MixedPrimitivesNested {
    a: Int;
    b: String?;
    c: Nested;

    init() {
        self.a = 1;
        self.b = null;
        self.c = Nested{ x: 2, y: true };
    }
}

struct Complex {
    intVal: Int;
    optA: Bool?;
    optB: String?;
    nested: Nested;
}

struct Nested {
    x: Int;
    y: String?;
    z: Bool;
}

contract ComplexFields {
    val: Complex;

    init() {
        self.val = Complex{
            intVal: 55,
            optA: null,
            optB: null,
            nested: Nested{
                x: 77,
                y: null,
                z: true
            }
        };
    }
}

struct Complex {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    nested: Nested;
}

struct Nested {
    int2: Int;
    optInt2: Int?;
    bool2: Bool;
    optBool2: Bool?;
}

contract Test {
    st: Complex;

    init() {
        self.st = Complex{
            intVal: 1,
            boolVal: true,
            optInt: null,
            optBool: false,
            nested: Nested{
                int2: 2,
                optInt2: null,
                bool2: false,
                optBool2: null,
            },
        };
    }
}
struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

struct Complex {
    s1: OptionalStruct;
    s2: OptionalStruct;
    s3: OptionalStruct;
}

contract Test14 {
    c: Complex;

    init() {
        self.c = Complex{
            s1: OptionalStruct{ a: 1, b: null, c: emptyCell() },
            s2: OptionalStruct{ a: null, b: true, c: null },
            s3: OptionalStruct{ a: null, b: null, c: null },
        };
    }
}
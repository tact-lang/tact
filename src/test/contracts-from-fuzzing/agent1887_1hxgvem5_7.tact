struct First {
    a: Int;
}

struct Second {
    b: Bool;
}

struct Third {
    c: Int;
    d: Bool;
}

struct Combined {
    first: First;
    second: Second;
    third: Third;
    optInt: Int?;
    optBool: Bool?;
}

contract ComboTest {
    data: Combined;

    init() {
        self.data = Combined{
            first: First{ a: 1 },
            second: Second{ b: false },
            third: Third{ c: 7, d: true },
            optInt: null,
            optBool: null,
        };
    }
}
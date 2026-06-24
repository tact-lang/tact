struct Extra {
    num: Int;
}

struct Complex {
    e1: Extra?;
    e2: Extra?;
    e3: Extra?;
}

contract OptionalStructs {
    s: Complex;

    init() {
        self.s = Complex{
            e1: Extra{ num: 1 },
            e2: null,
            e3: Extra{ num: 3 }
        };
    }

    receive() {}
}
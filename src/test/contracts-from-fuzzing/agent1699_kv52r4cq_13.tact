message(1) FooMsg {
    num: Int;
}

message(2) BarMsg {
    flag: Bool;
}

struct Complex {
    first: FooMsg?;
    second: BarMsg;
}

contract ComplexMix {
    data: Complex;

    init() {
        self.data = Complex{
            first: FooMsg{ num: 5 },
            second: BarMsg{ flag: true },
        };
    }
}
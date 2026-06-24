struct Ints {
    a: Int;
    b: Int;
}

struct WrapInt {
    inside: Ints;
}

contract WrapperInt {
    testField: WrapInt;

    init() {
        self.testField = WrapInt{
            inside: Ints{ a:1, b:2 }
        };
    }
}
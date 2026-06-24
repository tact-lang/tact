struct Complex {
    a: Int = 3;
    b: Bool;
}

contract Test {
    c: Complex;

    init() {
        self.c = Complex{b: true};
    }
}
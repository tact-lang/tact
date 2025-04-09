struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
}

contract TestContract {
    f1: Complex;

    init() {
        self.f1 = Complex{ i: 7, b: false, s: "test", c: emptyCell() };
    }
}
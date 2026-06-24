struct Complex {
    a: Int;
    b: Bool;
    c: String;
}

contract OptStructStorage {
    cplx: Complex?;

    init() {
        self.cplx = Complex{ a: 10, b: false, c: "hi" };
    }
}
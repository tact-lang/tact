struct Complex {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: Address? = null;
}

contract Test {
    saved: Complex;

    init() {
        self.saved = Complex{};
    }
}
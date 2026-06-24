struct Complex {
    x: Int;
    y: Bool?;
    z: String?;
    addr: Address;
}

contract ComplexFields {
    f1: Complex;
    f2: Complex?;

    init() {
        self.f1 = Complex{ x: 10, y: null, z: null, addr: myAddress() };
        self.f2 = null;
    }
}
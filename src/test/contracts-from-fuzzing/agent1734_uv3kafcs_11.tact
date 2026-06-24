struct Complex {
    x: Int = 10;
    y: Bool = false;
    z: String?;
    t: Int?;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{ x: 100, y: true, z: null, t: null };
    }
}
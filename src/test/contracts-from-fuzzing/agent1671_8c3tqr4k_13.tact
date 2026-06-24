struct Complex {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
    d: Int?; // defaults to null
    e: Bool?; // defaults to null
    f: String?; // defaults to null
}

contract Test {
    st: Complex;

    init() {
        self.st = Complex{};
    }
}
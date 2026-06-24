struct Complex {
    a: Int = 10;
    b: Bool?;
}

contract DefaultsAndOptional {
    data: Complex;

    init() {
        self.data = Complex{ };
    }
}
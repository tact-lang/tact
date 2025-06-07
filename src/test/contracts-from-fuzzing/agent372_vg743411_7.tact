struct Complex {
    x: Int;
    y: Bool;
    z: Address;
    opt1: String?;
    opt2: Address?;
}

contract Test {
    c: Complex;
    init() {
        self.c = Complex{
            x: 0,
            y: false,
            z: myAddress(),
            opt1: null,
            opt2: null
        };
    }
}
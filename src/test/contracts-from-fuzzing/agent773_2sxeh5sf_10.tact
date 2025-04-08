struct Complex {
    a: Int;
    b: Bool = true;
    c: String?;
}

contract LateInit {
    state: Complex;

    init() {
        self.state = Complex {
            a: 123,
            b: false,
            c: null
        };
    }

    receive() {}
}
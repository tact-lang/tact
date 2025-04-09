struct Complex {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: String?;
}

contract TestContract {
    fa: Int;
    fb: Complex;
    fc: Bool;
    fd: String;

    init() {
        self.fa = 123;
        self.fb = Complex{
            a: 5,
            b: false,
            c: null,
            d: "abc",
            e: "def"
        };
        self.fc = true;
        self.fd = "end";
    }
}
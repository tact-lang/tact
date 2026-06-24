struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
}

contract Direct {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: Address;
    f5: Complex;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = null;
        self.f4 = myAddress();
        self.f5 = Complex{ a: 5, b: true, c: "hi", d: myAddress() };
    }
}
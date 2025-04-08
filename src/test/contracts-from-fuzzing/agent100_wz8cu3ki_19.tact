struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract Test20 {
    m1: Mixed;
    m2: Mixed;

    init() {
        self.m1 = Mixed{ a: 1, b: true, c: "x", d: myAddress() };
        self.m2 = Mixed{ a: 2, b: false, c: "y", d: myAddress() };
    }
}
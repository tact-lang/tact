struct Group1 {
    a: Int;
    b: Int;
}

struct Group2 {
    c: Bool;
    d: Bool;
}

struct Group3 {
    e: String;
    f: Address;
}

contract Test {
    g1: Group1;
    g2: Group2;
    g3: Group3;

    init() {
        self.g1 = Group1{ a: 1, b: 2 };
        self.g2 = Group2{ c: true, d: false };
        self.g3 = Group3{ e: "tact", f: myAddress() };
    }
}
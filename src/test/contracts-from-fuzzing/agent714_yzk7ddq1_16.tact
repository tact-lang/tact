struct Group1 {
    a: Int;
    b: Bool;
}

struct Group2 {
    c: Bool;
    d: Int?;
}

contract MultiStructs {
    g1: Group1;
    g2: Group2;

    init() {
        self.g1 = Group1{ a: 1, b: true };
        self.g2 = Group2{ c: false, d: null };
    }
}
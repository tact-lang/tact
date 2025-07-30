struct SVal {
    a: Int;
    b: Bool;
}

contract ContractFields {
    f1: Int;
    f2: Bool;
    f3: SVal;

    init() {
        self.f1 = 8;
        self.f2 = true;
        self.f3 = SVal{ a: 5, b: false };
    }
}
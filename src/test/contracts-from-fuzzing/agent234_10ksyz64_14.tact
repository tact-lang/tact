struct S {
    f: Int;
}
contract ContractA {
    s: S;
    init() {
        self.s = S{ f: 1 };
    }
}

contract ContractB {
    s: S;
    init() {
        self.s = S{ f: 2 };
    }
}
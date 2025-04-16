struct SOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    s: SOpt?;

    init() {
        self.s = SOpt{ a: 20, b: null };
    }
}
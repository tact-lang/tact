struct OptBoolInt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    f1: OptBoolInt;
    f2: OptBoolInt?;

    init() {
        self.f1 = OptBoolInt{ a: 7, b: null };
        self.f2 = null;
    }
}
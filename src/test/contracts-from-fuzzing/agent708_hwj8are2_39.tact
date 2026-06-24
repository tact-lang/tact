struct C {
    constA: Int = 5;
    constB: Int = ton("1");
    constC: Int = pow(2,10);
}

contract ConstExprDefaults {
    data: C;
    init() {
        self.data = C{};
    }
}
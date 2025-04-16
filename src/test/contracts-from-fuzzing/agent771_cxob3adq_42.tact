contract BoolAndIntEdgeCases {
    minInt: Int = -115792089237316195423570985008687907853269984665640564039457584007913129639935;
    maxInt: Int = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    trueBool: Bool = true;
    falseBool: Bool = false;

    init() {
        self.minInt = -1;
        self.maxInt = 1;
        self.trueBool = false;
        self.falseBool = true;
    }
}
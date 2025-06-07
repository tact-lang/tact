contract NegativeZeroInit {
    numNeg: Int;
    numZero: Int;

    init() {
        self.numNeg = -0;
        self.numZero = 0;
    }
}

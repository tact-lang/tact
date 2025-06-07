contract BorderIntFail {
    n1: Int as int1;

    init() {
        self.n1 = 1;  // outside valid range for int1
    }
}
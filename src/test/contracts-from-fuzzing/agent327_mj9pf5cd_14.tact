struct Cpx {
    x: Int?;
}

contract Compound {
    st: Cpx;
    count: Int = 0;

    init() {
        self.st = Cpx{ x: null };
        self.count = 100;
    }
}

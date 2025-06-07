struct BoolInt {
    b: Bool;
    n: Int;
}

contract Reordered {
    f1: Bool;
    f2: Int;
    pair: BoolInt;
    x: Int;

    init() {
        self.f1 = true;
        self.f2 = 42;
        self.pair = BoolInt{ b:false, n:0 };
        self.x = 1;
    }
}
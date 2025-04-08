struct BoolInt {
    b: Bool;
    i: Int;
}

contract SwapOrder {
    d1: BoolInt;
    d2: BoolInt;

    init() {
        self.d1 = BoolInt{ b:true, i:1 };
        self.d2 = BoolInt{ b:false, i:2 };
    }
}
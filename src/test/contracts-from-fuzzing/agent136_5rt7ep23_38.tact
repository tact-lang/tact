struct BoolInt {
    flag: Bool;
    num: Int;
}

contract FieldOrder {
    v1: BoolInt;
    v2: BoolInt;

    init() {
        self.v1 = BoolInt{ flag:true, num:1 };
        self.v2 = BoolInt{ flag:false, num:2 };
    }
}
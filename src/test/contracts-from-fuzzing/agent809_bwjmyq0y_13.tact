struct BoolInts {
    flag: Bool;
    num: Int;
}

contract MultiVarAssignments {
    data: BoolInts;

    init() {
        self.data = BoolInts{ flag: false, num: 10 };
        self.data = BoolInts{ flag: true, num: 100 };
    }
}
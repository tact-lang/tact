struct Pair {
    left: Int;
    right: Int;
}

contract TupleInStruct {
    p: Pair;

    init() {
        self.p = Pair{ left:1, right:2 };
    }
}
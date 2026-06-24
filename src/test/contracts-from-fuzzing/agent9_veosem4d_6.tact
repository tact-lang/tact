struct DoubleNest {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    i: Int;
    flag: Bool;
    optionalS: String?;
}

struct Inner2 {
    cellVal: Cell;
    optA: Address?;
    val: Int;
}

contract TwoNestStructs {
    data: DoubleNest;
    init() {
        self.data = DoubleNest{
            inner1: Inner1{ i:1, flag:true, optionalS:null },
            inner2: Inner2{ cellVal: emptyCell(), optA:null, val:42 }
        };
    }
}
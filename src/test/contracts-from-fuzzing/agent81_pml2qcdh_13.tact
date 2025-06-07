struct TupleLike {
    a: Int;
    b: Bool;
}

contract NestedTuple {
    t1: TupleLike;
    t2: TupleLike;

    init() {
        self.t1 = TupleLike{ a:1, b:true };
        self.t2 = TupleLike{ a:2, b:false };
    }
}
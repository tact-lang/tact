struct TupleLike {
    i: Int;
    b: Bool;
}

contract TestContract {
    t1: TupleLike;
    t2: TupleLike;
    init() {
        self.t1 = TupleLike{ i:1, b:true };
        self.t2 = TupleLike{ i:2, b:false };
    }
}
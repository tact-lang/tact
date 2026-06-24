struct TupleLike {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract TupleContract {
    tup: TupleLike;

    init() {
        self.tup = TupleLike{a:1,b:2,c:3,d:4};
    }
}
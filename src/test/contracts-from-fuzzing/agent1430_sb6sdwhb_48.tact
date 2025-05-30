struct TupleExample {
    a: Int;
    b: Bool;
    c: String;
}

contract TupleContract {
    tup: TupleExample;

    init() {
        self.tup = TupleExample{
            a:42,
            b:true,
            c:"tuple"
        };
    }
}

struct TupleExample {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract TupleContract {
    tup: TupleExample;

    init() {
        self.tup = TupleExample{
            a:10, b:true, c:"str", d:myAddress(), e:emptyCell()
        };
    }
}
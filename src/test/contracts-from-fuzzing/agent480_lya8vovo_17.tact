struct TupleInner {
    x: Int;
    y: String;
}

contract TupleStorage {
    t1: TupleInner;
    t2: TupleInner;
    t3: TupleInner;

    init() {
        self.t1 = TupleInner{x: 1, y: "one"};
        self.t2 = TupleInner{x: 2, y: "two"};
        self.t3 = TupleInner{x: 3, y: "three"};
    }
}
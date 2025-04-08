struct TupleNested {
    a: Int;
    b: String;
}

struct OuterTuple {
    t1: TupleNested;
    t2: TupleNested;
}

contract TestContract {
    x: OuterTuple;

    init() {
        self.x = OuterTuple{
            t1: TupleNested{ a: 5, b: "foo" },
            t2: TupleNested{ a: 9, b: "bar" },
        };
    }
}
struct Tuple {
    x: Int;
    y: Int;
}

struct TupleOuter {
    a: Tuple;
    b: Tuple;
    c: Tuple;
}

contract TestContract {
    t: TupleOuter;

    init() {
        self.t = TupleOuter{
            a: Tuple{ x:1, y:2 },
            b: Tuple{ x:3, y:4 },
            c: Tuple{ x:5, y:6 }
        };
    }
}
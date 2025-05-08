contract TestContract {
    data: Tuple;
    init() {
        self.data = Tuple{
            v1: TupleInner{
                x: 1,
                y: "a"
            },
            v2: TupleInner{
                x: 2,
                y: "b"
            }
        };
    }
}

struct Tuple {
    v1: TupleInner;
    v2: TupleInner;
}

struct TupleInner {
    x: Int;
    y: String;
}

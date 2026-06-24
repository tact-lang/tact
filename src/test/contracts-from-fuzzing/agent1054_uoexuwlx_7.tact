contract TestContract {
    tupleTest: TupleContainer;

    init() {
        self.tupleTest = TupleContainer{
            a: 1,
            b: true,
            c: "hi",
            d: -99
        };
    }
}

struct TupleContainer {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
}
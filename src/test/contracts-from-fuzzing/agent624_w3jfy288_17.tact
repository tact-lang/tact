struct A { x: Int; }
struct B { y: Bool; }
struct TupleWrap {
    a: A;
    b: B;
}

contract OptionalTupleWrap {
    data: TupleWrap?;

    init() {
        self.data = null;
    }
}
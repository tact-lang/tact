struct TupleLike {
    a: Int;
    b: Bool;
    c: String;
}

contract TupleStorage {
    f: TupleLike;

    init() {
        self.f = TupleLike{ a: 42, b: true, c: "hi" };
    }
}
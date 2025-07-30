struct SmallTuple {
    x: Int;
    y: Int;
}

struct BigTuple {
    inner: SmallTuple;
    z: Int;
}

contract TupleStorage {
    t: BigTuple;

    init() {
        self.t = BigTuple{
            inner: SmallTuple{ x: 1, y: 2 },
            z: 3
        };
    }
}
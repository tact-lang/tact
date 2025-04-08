struct Inner {
    x: Int;
    y: Int;
}

contract TupleStructPersistent {
    point: Inner;
    init() {
        self.point = Inner{x: 5, y: 6};
    }
}
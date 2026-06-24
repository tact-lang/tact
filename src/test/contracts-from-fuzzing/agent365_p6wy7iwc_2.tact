struct Inner {
    x: Int;
    y: Int;
}

contract NestedStruct {
    point: Inner;
    init() {
        self.point = Inner{x: 1, y: 2};
    }
}
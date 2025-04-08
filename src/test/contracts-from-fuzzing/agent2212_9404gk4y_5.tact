struct Inner {
    x: Int;
}

contract Test {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}

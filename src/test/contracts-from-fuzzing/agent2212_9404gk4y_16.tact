struct Inner {
    v: Int?;
}

contract Test {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = Inner{v:42};
    }
}

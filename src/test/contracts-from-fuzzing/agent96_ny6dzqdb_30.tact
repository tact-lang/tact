struct NestedOpt {
    opt: Int?;
}

contract Test {
    a: NestedOpt?;

    init() {
        self.a = null;
    }
}
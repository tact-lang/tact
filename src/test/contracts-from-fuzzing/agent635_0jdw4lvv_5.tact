struct NestedOpt {
    innerOpt: Int?;
    anotherOpt: String?;
}

contract Test {
    maybe: NestedOpt?;

    init() {
        self.maybe = null;
    }
}

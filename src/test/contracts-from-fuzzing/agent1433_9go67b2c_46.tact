struct InnerS {
    a: Int;
    b: String?;
}

contract NestedOptStructs {
    s: InnerS?;

    init() {
        self.s = null;
    }
}

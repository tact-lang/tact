struct WrappedStrs {
    a: String;
    b: String;
}

contract NestedStrings {
    s: WrappedStrs;

    init() {
        self.s = WrappedStrs{ a:"hi", b:"bye" };
    }
}

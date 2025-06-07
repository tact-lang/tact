struct NestedOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract WrappedOptionals {
    w: NestedOptionals?;

    init() {
        self.w = null;
    }
}
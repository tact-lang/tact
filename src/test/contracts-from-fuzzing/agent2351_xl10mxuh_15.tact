struct InnerS {
    nested: String?;
}

struct MidS {
    inner: InnerS?;
}

contract NestedOptionalWrapped {
    m: MidS?;

    init() {
        self.m = null;
    }
}

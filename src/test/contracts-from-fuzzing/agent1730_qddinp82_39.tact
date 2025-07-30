struct Wrap {
    ival: Int?;
}

contract NullWrapNest {
    wrap1: Wrap?;
    wrap2: Wrap?;

    init() {
        self.wrap1 = null;
        self.wrap2 = Wrap{ ival: 42 };
    }
}
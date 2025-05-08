struct NestedOptionals {
    innermost: Int?;
}

struct MiddleOpt {
    nested: NestedOptionals?;
}

contract NullInMiddle {
    storage: MiddleOpt = MiddleOpt{ nested: null };

    init() {
        self.storage = MiddleOpt {
            nested: NestedOptionals { innermost: 77 }
        };
    }
}
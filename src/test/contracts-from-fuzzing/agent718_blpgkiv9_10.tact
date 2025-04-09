struct NestedOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
}

struct OuterWrap {
    nested: NestedOptionals?;
}

contract OptionalWrapped {
    data: OuterWrap;
    init() {
        self.data = OuterWrap{ nested: null };
    }
}
struct Base {
    a: Int;
}

struct Wrapper {
    sub: Base?;
}

contract NestedOptStructs {
    field: Wrapper = Wrapper{ sub: null };

    init() {
        self.field = Wrapper{ sub: Base{ a: 99 } };
    }
}
struct Deep {
    sub: InnerDeep;
}

struct InnerDeep {
    field: Int?;
}

contract Test {
    nested: Deep;

    init() {
        self.nested = Deep{ sub: InnerDeep{ field: null } };
    }
}
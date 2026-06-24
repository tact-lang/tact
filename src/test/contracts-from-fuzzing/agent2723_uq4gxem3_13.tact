struct Base {
    a: Int;
}

struct Mid {
    base: Base;
    b: Int?;
}

contract NestOptField {
    field: Mid;
    init() {
        self.field = Mid{ base: Base{ a: 1 }, b: null };
    }
}
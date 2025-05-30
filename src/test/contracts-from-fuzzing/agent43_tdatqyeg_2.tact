struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract HasNestedOptional {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{ a: null, b: null };
    }
}
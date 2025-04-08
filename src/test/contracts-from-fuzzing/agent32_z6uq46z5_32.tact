contract StructAsOptionalField {
    field: S?;

    init() {
        self.field = null;
    }
}

struct S {
    a: Int;
    b: Bool;
}

struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TopOptionals {
    nested: NestedOptionals?;

    init() {
        self.nested = null;
    }
}
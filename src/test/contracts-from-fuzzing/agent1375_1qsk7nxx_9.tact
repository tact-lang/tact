struct SubNested {
    s: String;
    c: Cell;
}

contract NestedOptionals {
    a: Int?;
    b: String?;
    nested: SubNested?;

    init() {
        self.a = null;
        self.b = null;
        self.nested = null;
    }
}
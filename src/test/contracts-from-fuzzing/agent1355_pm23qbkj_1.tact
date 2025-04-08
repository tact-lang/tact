struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StorageFuzz {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            a: null,
            b: null,
            c: null
        };
    }
}
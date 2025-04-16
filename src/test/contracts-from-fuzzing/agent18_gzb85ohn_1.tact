struct Nested {
    val: Int;
    opt: Int?;
}

contract DeeplyNested {
    nested: Nested;
    deeply: Nested;

    init() {
        self.nested = Nested{val: 1, opt: null};
        self.deeply = Nested{val: 2, opt: 5};
    }
}
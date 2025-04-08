struct Nested {
    val: Int;
    optVal: Bool?;
}

contract OptNestedTest {
    nested: Nested;

    init() {
        self.nested = Nested{val: 10, optVal: null};
    }
}
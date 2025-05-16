struct Nested {
    a: Int;
    b: Bool;
}

contract PersistTest {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Slice;
    nested: Nested;
    optionalNested: Nested?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "abc";
        self.field4 = emptyCell().asSlice();
        self.nested = Nested{ a: 42, b: false };
        self.optionalNested = null;
    }
}
struct Nested {
    value: Int;
}

contract DeepPersistence {
    field1: Int = 1;
    field2: Bool = true;
    field3: String = "test";
    nested: Nested = Nested{value: 5};
    optionalNested: Nested? = null;

    init() {
        self.field1 = 123;
        self.field2 = false;
        self.field3 = "updated";
        self.nested = Nested{value: 42};
        self.optionalNested = Nested{value: 99};
    }
}
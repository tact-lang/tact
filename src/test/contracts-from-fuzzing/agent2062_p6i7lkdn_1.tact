struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract ComplexStorage {
    field1: Int;
    field2: Bool;
    field3: String;
    nested: Nested;
    optionalField: Int?;
    optionalNested: Nested?;
    initialized: Int = 10;
    flag: Bool = true;
    greeting: String = "Hello";
    nestedWithDefault: Nested = Nested{a: 1, b: false, c: "Test"};

    init() {
        self.field1 = 123;
        self.field2 = false;
        self.field3 = "abc";
        self.nested = Nested{a: 5, b: true, c: "xyz"};
        self.optionalField = null;
        self.optionalNested = null;
    }
}
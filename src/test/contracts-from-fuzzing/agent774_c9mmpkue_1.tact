struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    field1: Int;
    field2: String;
    field3: Bool;
    nestedField: Nested;

    init() {
        self.field1 = 1;
        self.field2 = "hello";
        self.field3 = true;
        self.nestedField = Nested{ inner1: 10, inner2: false };
    }
}
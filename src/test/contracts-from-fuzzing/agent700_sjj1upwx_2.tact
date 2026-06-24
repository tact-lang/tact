struct Nested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract ManyOptionals {
    value: Int = 1;
    nestedField: Nested?;
    optionalBool: Bool?;
    optionalString: String?;

    init() {
        self.nestedField = null;
        self.optionalBool = null;
        self.optionalString = null;
    }
}
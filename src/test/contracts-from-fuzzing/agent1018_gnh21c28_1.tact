struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    simpleField: Int;
    optionalField: Bool?;
    nestedField: Inner;

    init() {
        self.simpleField = 10;
        self.optionalField = true;
        self.nestedField = Inner{
            a: 1,
            b: false,
            c: "test nested"
        };
    }
}
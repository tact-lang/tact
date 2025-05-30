struct A {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedTypes {
    a: A;

    init() {
        self.a = A{
            intField: 7,
            boolField: false,
            strField: "string",
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}

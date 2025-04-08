struct A {
    intField: Int;
    strField: String;
    boolField: Bool;
}

contract ManyTypesPersistent {
    rec: A;
    intVar: Int = 0;
    strVar: String = "";
    boolVar: Bool = false;

    init() {
        self.rec = A{
            intField: 123,
            strField: "abc",
            boolField: true,
        };
        self.intVar = -9999;
        self.strVar = "hello";
        self.boolVar = true;
    }
}

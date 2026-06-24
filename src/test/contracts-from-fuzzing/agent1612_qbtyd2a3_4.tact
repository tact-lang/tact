struct A {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{
            intField: 1,
            boolField: true,
            stringField: "str",
            optInt: null,
            optBool: null,
            optString: null,
        };
    }

    receive() {
        let _ = self.a.intField;
    }
}
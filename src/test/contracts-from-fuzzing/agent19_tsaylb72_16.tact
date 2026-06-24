struct A {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract AllOptionalsVariant {
    data: A;

    init() {
        self.data = A{
            intField: 5,
            boolField: false,
            stringField: "zzz",
            optInt: null,
            optBool: null,
            optString: null,
        };
    }
}

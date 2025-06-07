struct A {
    intField: Int;
    boolField: Bool?;
    strField: String;
    addrField: Address?;
}

contract ComboFields {
    data: A;

    init() {
        self.data = A{
            intField: 123,
            boolField: null,
            strField: "xyz",
            addrField: null
        };
    }
}
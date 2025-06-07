struct InnerStruct {
    nestedInt: Int;
    nestedBool: Bool;
    nestedString: String;
}

contract TestNested {
    myField: InnerStruct;

    init() {
        self.myField = InnerStruct{
            nestedInt: 10,
            nestedBool: false,
            nestedString: "Nested"
        };
    }
}

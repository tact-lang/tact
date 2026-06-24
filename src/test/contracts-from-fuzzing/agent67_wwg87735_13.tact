struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract OptionalStructField {
    myField: InnerStruct?;

    init() {
        self.myField = InnerStruct{
            x: 42,
            y: null
        };
    }
}

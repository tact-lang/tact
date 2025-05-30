struct OptionalPrimitiveHolder {
    flag: Bool?;
    someInt: Int?;
    someStr: String?;
}

contract OptionalFieldsContract {
    fieldSet: OptionalPrimitiveHolder;

    init() {
        self.fieldSet = OptionalPrimitiveHolder{
            flag: true,
            someInt: 123,
            someStr: "hello",
        };
    }
}
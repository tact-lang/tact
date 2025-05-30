struct ComboStruct {
    requiredField: Int;
    optionalField: Bool?;
    defaultOptField: Address? = null;
    defaultRequiredField: String = "hello";
}

contract ComboStructHolder {
    s: ComboStruct;
    init() {
        self.s = ComboStruct{
            requiredField: 1,
            optionalField: null,
        };
    }
}

struct ComboStruct {
    flag: Bool;
    count: Int;
    label: String;
    maybe: Int?;
}

contract StructFieldCombo {
    data: ComboStruct;

    init() {
        self.data = ComboStruct{
            flag: true,
            count: 77,
            label: "x",
            maybe: null,
        };
    }
}
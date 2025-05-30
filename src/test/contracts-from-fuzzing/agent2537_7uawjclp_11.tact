struct OptionInStruct {
    val: Int?;
    note: String;
}

contract OptStructStore {
    s: OptionInStruct;
    init() {
        self.s = OptionInStruct{
            val: null,
            note: "Test"
        };
    }
}
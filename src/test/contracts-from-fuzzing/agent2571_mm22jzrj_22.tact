struct OptionStringStruct {
    optStr: String?;
}

contract OptStructRef {
    val: OptionStringStruct?;

    init() {
        self.val = OptionStringStruct{
            optStr: null
        };
    }
}

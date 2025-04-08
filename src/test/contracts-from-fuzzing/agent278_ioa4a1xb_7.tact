struct OptionInStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructDef {
    st: OptionInStruct;

    init() {
        self.st = OptionInStruct{
            x: null,
            y: null
        };
    }
}
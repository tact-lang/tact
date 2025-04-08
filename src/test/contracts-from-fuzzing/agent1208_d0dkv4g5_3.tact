struct OptionStruct {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    txt: String?;
}

contract TestOptional {
    data: OptionStruct;
    
    init() {
        self.data = OptionStruct{
            foo: null,
            bar: true,
            addr: null,
            txt: "hi"
        };
    }
}
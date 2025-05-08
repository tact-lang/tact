struct OptionInStruct {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
    f6: String?;
}

contract StructWithOptionStruct {
    x: OptionInStruct;

    init() {
        self.x = OptionInStruct{
            f1:null,f2:null,f3:null,f4:null,f5:null,f6:null
        };
    }
}

struct DeepOptStruct {
    lvl1: Int?;
    lvl2: Int?;
    lvl3: Int?;
    lvl4: Int?;
    lvl5: Int?;
    lvl6: Int?;
    lvl7: Int?;
    lvl8: Int?;
    lvl9: Int?;
    lvl10: Int?;
}

contract DeepOptContract {
    val: DeepOptStruct;

    init() {
        self.val = DeepOptStruct{
            lvl1:null,lvl2:null,lvl3:null,lvl4:null,lvl5:null,
            lvl6:null,lvl7:null,lvl8:null,lvl9:null,lvl10:null
        };
    }
}
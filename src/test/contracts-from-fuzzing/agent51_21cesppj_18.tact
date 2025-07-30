struct BigNested {
    lvl1: Int;
    lvl2: String;
    lvl3: Bool;
    lvl4: Int?;
    lvl5: Bool?;
    lvl6: String?;
    lvl7: Int;
    lvl8: String;
    lvl9: Bool;
    lvl10: Int?;
    lvl11: Bool?;
    lvl12: String?;
}

contract HugeStructHolder {
    data: BigNested;

    init() {
        self.data = BigNested{
            lvl1:1, lvl2:"a", lvl3:true, lvl4:null, lvl5:null, lvl6:null,
            lvl7:7, lvl8:"b", lvl9:false, lvl10:null, lvl11:null, lvl12:null
        };
    }
}
struct LargeNest {
    lvl1: Int;
    lvl2: Int?;
    lvl3: Int;
    lvl4: Int?;
    lvl5: Int;
    lvl6: Int?;
    lvl7: Int;
    lvl8: Int?;
    lvl9: Int;
    lvl10: Int?;
}

contract BigOptionalMix {
    store: LargeNest;

    init() {
        self.store = LargeNest{
            lvl1:1,lvl2:null,lvl3:3,lvl4:null,lvl5:5,
            lvl6:null,lvl7:7,lvl8:null,lvl9:9,lvl10:null
        };
    }
}
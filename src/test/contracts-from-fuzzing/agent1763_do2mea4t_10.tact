struct Levels {
    lvl1: Int;
    lvl2: Int?;
    lvl3: Int;
    lvl4: Int?;
}

contract OptionalInterleaved {
    data: Levels;

    init() {
        self.data = Levels{ lvl1:1, lvl2:null, lvl3:2, lvl4:null };
    }
}
struct Levels4 {
    lvl1: Int;
    lvl2: Int?;
    lvl3: String;
    lvl4: Bool?;
}

contract OptionMix {
    s: Levels4;
    init() {
        self.s = Levels4{
            lvl1:1,
            lvl2:null,
            lvl3:"hi",
            lvl4:true
        };
    }
}
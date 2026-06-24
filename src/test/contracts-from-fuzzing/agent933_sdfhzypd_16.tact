struct Levels {
    lvl1: Int;
    lvl2: Int;
    lvl3: Int;
    lvl4: Int;
    lvl5: Int;
    lvl6: Int;
    lvl7: Int;
    lvl8: Int;
    lvl9: Int;
    lvl10: Int;
    lvl11: Int;
    lvl12: Int;
    lvl13: Int;
    lvl14: Int;
    lvl15: Int;
    lvl16: Int;
}

contract Test {
    data: Levels;
    init() {
        self.data = Levels{
            lvl1:1, lvl2:2, lvl3:3, lvl4:4, lvl5:5, lvl6:6, lvl7:7, lvl8:8,
            lvl9:9, lvl10:10, lvl11:11, lvl12:12, lvl13:13, lvl14:14, lvl15:15, lvl16:16
        };
    }
}
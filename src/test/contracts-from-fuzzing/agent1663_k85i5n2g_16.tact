struct DeepDeep {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
    level6: Int;
    level7: Int;
    level8: Int;
    level9: Int;
    level10: Int;
    level11: Int;
    level12: Int;
    level13: Int;
    level14: Int;
    level15: Int;
    level16: Int;
    level17: Int;
    level18: Int;
    level19: Int;
    level20: Int;
}

contract ManyPersistentVars {
    stuff: DeepDeep;
    init() {
        self.stuff = DeepDeep{
            level1:1, level2:2, level3:3, level4:4,
            level5:5, level6:6, level7:7, level8:8,
            level9:9, level10:10, level11:11, level12:12,
            level13:13, level14:14, level15:15, level16:16,
            level17:17, level18:18, level19:19, level20:20
        };
    }
}
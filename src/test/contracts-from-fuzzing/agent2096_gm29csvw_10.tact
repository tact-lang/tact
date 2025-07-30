struct MegaNested {
    level1: Int;
    level2: Bool;
    level3: Int?;
    level4: Bool?;
    level5: Int;
    level6: Bool;
    level7: Int?;
    level8: Bool?;
    level9: Int;
    level10: Bool;
}

contract LargeSingleStruct {
    big: MegaNested;
    init() {
        self.big = MegaNested{
            level1: 1,
            level2: true,
            level3: null,
            level4: false,
            level5: 5,
            level6: true,
            level7: null,
            level8: true,
            level9: 9,
            level10: false,
        };
    }
}
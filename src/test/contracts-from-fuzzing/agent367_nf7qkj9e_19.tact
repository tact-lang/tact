struct LevelOne {
    lvlTwo: LevelTwo;
}

struct LevelTwo {
    lvlThree: LevelThree;
}

struct LevelThree {
    lvlFour: LevelFour;
}

struct LevelFour {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract EverythingDeep {
    allData: LevelOne;

    init() {
        self.allData = LevelOne{
            lvlTwo: LevelTwo{
                lvlThree: LevelThree{
                    lvlFour: LevelFour{
                        intVal: -1,
                        boolVal: true,
                        strVal: "abc",
                        addrVal: myAddress(),
                        cellVal: emptyCell(),
                        sliceVal: emptyCell().asSlice(),
                        optInt: null,
                        optBool: null,
                        optAddr: null,
                        optCell: null,
                        optSlice: null,
                        optStr: null
                    }
                }
            }
        };
    }
}
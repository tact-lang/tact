struct DeeplyEmbedded {
    one: Int;
    nested: LevelTwo;
}

struct LevelTwo {
    two: Int;
    nested: LevelThree;
}

struct LevelThree {
    three: Int;
    nested: LevelFour;
}

struct LevelFour {
    four: Int;
}

contract FourLayerStruct {
    s: DeeplyEmbedded;

    init() {
        self.s = DeeplyEmbedded{
            one:1,
            nested: LevelTwo{
                two:2,
                nested: LevelThree{
                    three:3,
                    nested: LevelFour{
                        four:4
                    }
                }
            }
        };
    }
}
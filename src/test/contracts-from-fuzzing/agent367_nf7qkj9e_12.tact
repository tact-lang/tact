struct Deep {
    one: LevelA;
}

struct LevelA {
    two: LevelB;
}

struct LevelB {
    three: LevelC;
}

struct LevelC {
    four: LevelD;
}

struct LevelD {
    val: Int;
}

contract TestDeep2 {
    data: Deep;

    init() {
        self.data = Deep{
            one: LevelA{
                two: LevelB{
                    three: LevelC{
                        four: LevelD{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}
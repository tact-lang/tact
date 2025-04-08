struct LevelA {
    next: LevelB;
}

struct LevelB {
    next: LevelC;
}

struct LevelC {
    next: LevelD;
}

struct LevelD {
    flag: Bool;
    txt: String;
    num: Int?;
}

contract Deeper {
    data: LevelA;

    init() {
        self.data = LevelA{
            next: LevelB{
                next: LevelC{
                    next: LevelD{
                        flag: false,
                        txt: "edge",
                        num: null
                    }
                }
            }
        };
    }
}

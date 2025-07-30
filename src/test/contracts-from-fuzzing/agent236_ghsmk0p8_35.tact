struct LevelD {
    num: Int;
}

struct LevelC {
    child: LevelD;
}

struct LevelB {
    child: LevelC;
}

struct LevelA {
    child: LevelB;
}

contract TestContract {
    root: LevelA;

    init() {
        self.root = LevelA{
            child: LevelB{
                child: LevelC{
                    child: LevelD{num:42}
                }
            }
        };
    }
}
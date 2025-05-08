struct LevelE { num: Int; }
struct LevelD { child: LevelE; }
struct LevelC { child: LevelD; }
struct LevelB { child: LevelC; }
struct LevelA { child: LevelB; }

contract TestContract {
    root: LevelA;
    init() {
        self.root = LevelA{
            child: LevelB{
                child: LevelC{
                    child: LevelD{
                        child: LevelE{num:123}
                    }
                }
            }
        };
    }
}
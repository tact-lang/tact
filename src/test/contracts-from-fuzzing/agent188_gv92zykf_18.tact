contract OptionalChain {
    data: LevelA?;
    init() {
        self.data = LevelA{
            next: LevelB{
                next: LevelC{
                    next: LevelD{
                        x: 999
                    }
                }
            }
        };
    }
}

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
    x: Int;
}

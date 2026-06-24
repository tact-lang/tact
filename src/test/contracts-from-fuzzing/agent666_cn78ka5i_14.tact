struct DeepLong {
    p: LevelA;
}

struct LevelA { q: LevelB; }
struct LevelB { r: LevelC; }
struct LevelC { s: LevelD; }
struct LevelD { t: Int; }

contract Chain {
    fld: DeepLong;

    init() {
        self.fld = DeepLong{
            p: LevelA{
                q: LevelB{
                    r: LevelC{
                        s: LevelD{
                            t: 55
                        }
                    }
                }
            }
        };
    }
}

struct LevelC {
    m: Int as uint8;
    n: Bool?;
    o: String?;
}

struct LevelB {
    p: Int?; 
    q: LevelC;
}

struct LevelA {
    r: Int as int16;
    s: LevelB;
}

contract DeepHintsOpts {
    data: LevelA;

    init() {
        self.data = LevelA{
            r: -32768,
            s: LevelB{
                p: null,
                q: LevelC{
                    m: 255,
                    n: true,
                    o: null
                }
            }
        };
    }
}
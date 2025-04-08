struct DeepMix {
    a: Int;
    b: LevelB?;
}

struct LevelB {
    c: Int = 42;
    d: LevelC?;
}

struct LevelC {
    e: Int;
    f: Int?;
}

contract TestContract {
    val: DeepMix;

    init() {
        self.val = DeepMix{
            a:1,
            b: LevelB{
                d: LevelC{
                    e:2,
                    f:null
                }
            }
        };
    }
}
struct DeepOptChain {
    a: Int?;
    b: LevelB?;
}

struct LevelB {
    c: Int?;
    d: LevelC?;
}

struct LevelC {
    e: Bool?;
}

contract DeepOptionals {
    data: DeepOptChain;
    init() {
        self.data = DeepOptChain{
            a:null,
            b: LevelB{
                c:null,
                d: LevelC{ e:null }
            }
        };
    }
}
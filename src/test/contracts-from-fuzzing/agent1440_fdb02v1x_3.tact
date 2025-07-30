struct DeepNest {
    i: Int;
    sub: Level1;
}

struct Level1 {
    flag: Bool;
    sub2: Level2;
}

struct Level2 {
    txt: String;
    valOpt: Int?;
}

contract DeepTest {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            i: 5,
            sub: Level1{
                flag: true,
                sub2: Level2{ txt: "abc", valOpt: null }
            }
        };
    }
}
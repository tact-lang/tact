struct Level3 {
    v1: Int?;
    v2: Bool;
}

struct Level2 {
    s1: Level3;
    optInner: Level3?;
}

struct Level1 {
    rec: Level2;
    optRec: Level2?;
}

contract TestContract {
    state: Level1;
    init() {
        self.state = Level1{
            rec: Level2{
                s1: Level3{v1: null, v2:false},
                optInner: null,
            },
            optRec: null,
        };
    }
}
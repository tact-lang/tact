struct Level3 {
    s: String;
}

struct Level2 {
    optInner: Level3?;
}

struct Level1 {
    optOut: Level2?;
}

contract TestContract {
    deepOpt: Level1?;
    init() {
        self.deepOpt = Level1{
            optOut: Level2{
                optInner: null
            }
        };
    }
}
struct Level2 {
    flag: Bool;
    count: Int;
}

struct Level1 {
    data: Level2;
    optData: Level2?;
}

contract DeepNested {
    nested: Level1;
    optNested: Level1?;
    init() {
        self.nested = Level1{
            data: Level2{flag: true, count: 10},
            optData: null,
        };
        self.optNested = null;
    }
    receive() {
        if (self.optNested != null) {
            let _ = self.optNested!!;
        }
    }
}
struct Level1 {
    v: Int;
}

struct Level2 {
    optLevel1: Level1?;
    b: Bool;
}

struct Level3 {
    optLevel2: Level2?;
    i: Int;
}

contract DeepOptionStructs {
    data: Level3;

    init() {
        self.data = Level3{
            optLevel2: null,
            i: 55
        };
    }
}

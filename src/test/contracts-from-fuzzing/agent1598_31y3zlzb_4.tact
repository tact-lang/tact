struct Level3 {
    deep: String?;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    count: Int?;
}

contract DeepNest {
    state: Level1;
    init() {
        self.state = Level1{
            l2: Level2{l3: Level3{deep: null}, flag: true},
            count: null
        };
    }
}
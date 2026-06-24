struct Level3 {
    a: Int;
}

struct Level2 {
    nested3: Level3;
    b: Bool;
}

struct Level1 {
    nested2: Level2;
}

contract DeepContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested2: Level2{ nested3: Level3{a: 42}, b: false }
        };
    }
}
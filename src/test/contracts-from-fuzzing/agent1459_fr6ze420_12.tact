// Deeply nested 4 level struct
struct Level4 {
    val: String;
}
struct Level3 {
    l4: Level4;
}
struct Level2 {
    l3: Level3;
}
struct Level1 {
    l2: Level2;
}

contract DeepNest {
    x: Level1;

    init() {
        self.x = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ val: "deep" } } } };
    }
}
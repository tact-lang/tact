struct Level3 {
    f3: String;
}

struct Level2 {
    f2: Level3;
}

struct Level1 {
    f1: Level2;
}

contract DeepNest {
    val: Level1;

    init() {
        self.val = Level1{ f1: Level2{ f2: Level3{ f3: "deep" } } };
    }
}
// test explicit nested struct defaults (allowed)

struct Level2 {
    z: Int = 100;
}

struct Level1 {
    nest: Level2 = Level2{};
}

contract NestedWithDefaults {
    data: Level1;
    init() {
        self.data = Level1{};
    }
}
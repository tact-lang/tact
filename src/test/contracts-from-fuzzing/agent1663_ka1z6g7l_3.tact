struct Level3 {
    deep: Int;
}

struct Level2 {
    nested: Level3;
    optional: Level3?;
}

struct Level1 {
    mid: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                nested: Level3{ deep: 5 },
                optional: null,
            }
        };
    }
}
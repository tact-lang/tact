struct Level3 {
    deep: Int;
}

struct Level2 {
    deeper: Level3;
}

struct Level1 {
    deepest: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            deepest: Level2{
                deeper: Level3{ deep: 77 }
            }
        };
    }
}
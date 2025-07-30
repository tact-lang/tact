struct Level3 {
    deep: Int?;
}

struct Level2 {
    nested: Level3;
    flag2: Bool;
}

struct Level1 {
    flag1: Bool;
    lvl2: Level2;
}

contract DeepLayers {
    content: Level1;

    init() {
        self.content = Level1{
            flag1: true,
            lvl2: Level2{
                nested: Level3{ deep: null },
                flag2: false
            }
        };
    }
}

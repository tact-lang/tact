struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    deeper: Level2;
}

contract DeepHierarchy {
    root: Level1;

    init() {
        self.root = Level1{deeper: Level2{nested: Level3{val: null}}};
    }
}

struct LevelA {
    id: Int;
}

struct LevelB {
    nested: LevelA?;
}

struct LevelC {
    nested: LevelB?;
}

contract DeepOptionals {
    val: LevelC;

    init() {
        self.val = LevelC{ nested: null };
    }
}
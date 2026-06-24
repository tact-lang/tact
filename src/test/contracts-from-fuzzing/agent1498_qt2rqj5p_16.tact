struct DeepOptionals {
    lv1: Level1Option?;
}

struct Level1Option {
    lv2: Level2Option?;
}

struct Level2Option {
    lv3: Level3Option?;
}

struct Level3Option {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    deep: DeepOptionals;

    init() {
        self.deep = DeepOptionals{
            lv1: null
        };
    }
}

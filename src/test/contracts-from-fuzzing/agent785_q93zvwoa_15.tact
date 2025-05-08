struct Level3 {
    deepInt: Int;
    deepBool: Bool;
}

struct Level2 {
    inner: Level3;
    optStr: String?;
}

struct Level1 {
    nested: Level2;
    optInt: Int?;
}

contract DeepMix {
    val: Level1?;

    init() {
        self.val = null;
    }
}
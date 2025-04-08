struct Level3 {
    u: Int = 7;
    v: String?;
}

struct Level2 {
    inner: Level3 = Level3{};
    z: Bool? = null;
}

struct Level1 {
    inner: Level2 = Level2{};
    s: String = "qwe";
}

contract DeepDefaults {
    data: Level1;

    init() {
        self.data = Level1{};
    }
}
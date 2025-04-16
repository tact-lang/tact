struct Level3 {
    val: Int = 7;
}

struct Level2 {
    l3: Level3 = Level3{};
    s: String? = null;
}

struct Level1 {
    l2: Level2 = Level2{};
    flag: Bool = true;
}

contract Test {
    data: Level1;

    init() {
        self.data = Level1{};
    }
}
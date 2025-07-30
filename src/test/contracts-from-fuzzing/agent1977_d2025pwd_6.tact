struct Level3 {
    val: Int?;
}

struct Level2 {
    opt: Level3?;
}

struct Level1 {
    opt2: Level2?;
}

contract Test {
    complexOpt: Level1?;

    init() {
        self.complexOpt = null;
    }
}

struct Level3 {
    val: Int?;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    mid: Level2?;
}

contract TestContract {
    deepOptional: Level1?;

    init() {
        self.deepOptional = null;
    }
}
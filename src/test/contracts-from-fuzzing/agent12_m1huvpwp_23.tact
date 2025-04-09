struct Level3 {
    z: String?;
}

struct Level2 {
    x: Int;
    y: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    val: Level1?;

    init() {
        self.val = null;
    }
}
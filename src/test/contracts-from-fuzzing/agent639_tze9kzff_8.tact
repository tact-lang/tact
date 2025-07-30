struct Level1 {
    val: Int?;
}

struct Level2 {
    inner: Level1?;
}

struct Level3 {
    inner: Level2?;
}

contract DeepOptional {
    data: Level3?;

    init() {
        self.data = null;
    }

    receive() {}
}
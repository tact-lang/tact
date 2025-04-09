// deeply nested optional containing nested optional
struct Level2 {
    x: Int?;
}

struct Level1 {
    inner: Level2?;
}

contract DeepOptional {
    deep: Level1?;

    init() {
        self.deep = null;
    }
}

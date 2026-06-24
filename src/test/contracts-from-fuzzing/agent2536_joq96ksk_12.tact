// deeply nested optional struct inside optional struct
struct Level2 {
    v: Int;
}

struct Level1 {
    inner: Level2?;
}

contract DeepOptionalStruct {
    outer: Level1?;

    init() {
        self.outer = null;
    }
}
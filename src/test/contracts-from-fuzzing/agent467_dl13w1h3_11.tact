// Testing deeply nested optional struct fields combination
struct Level1 {
    value: Int?;
}

struct Level2 {
    child: Level1?;
}

struct Level3 {
    child: Level2?;
}

contract OptNested {
    val: Level3;

    init() {
        self.val = Level3{child: null};
    }
}

// deeply nested optional structs
struct Level3 {
    val: Int = 33;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepOptional {
    l1: Level1?;
    init() {
        self.l1 = Level1{ l2: Level2{ l3: Level3{} } };
    }
}
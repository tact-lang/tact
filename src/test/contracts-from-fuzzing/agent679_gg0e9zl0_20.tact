// Deep multi-level defaulted struct fields
struct Level3 {
    val: Int = 5;
}

struct Level2 {
    nested: Level3 = Level3{};
}

struct Level1 {
    nested: Level2 = Level2{};
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{};
    }
}
struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    field: Level1;

    init() {
        // Not explicitly setting field
        self.field = Level1{};
    }
}
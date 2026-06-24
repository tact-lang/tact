struct Level1 {
    i: Int;
}

struct Level2 {
    l1: Level1?;
}

contract NestedStructOptionals {
    data: Level2?;

    init() {
        self.data = Level2{ l1: null };
    }
}
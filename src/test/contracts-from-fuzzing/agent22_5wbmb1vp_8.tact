struct MultiNestedOptionals {
    inner1: Level1?;
}

struct Level1 {
    inner2: Level2?;
}

struct Level2 {
    inner3: Level3?;
}

struct Level3 {
    val: String?;
}

contract TestContract {
    m: MultiNestedOptionals;

    init() {
        self.m = MultiNestedOptionals{inner1: null};
    }
}
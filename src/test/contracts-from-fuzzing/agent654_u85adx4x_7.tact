// Deep optional chain (allowed for single optional layer)
struct Level3 {
    flag: Bool;
}

struct Level2 {
    data: Level3?;
}

struct Level1 {
    val: Level2?;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            val: null,
        };
    }
}
struct Level3 {
    name: String?;
}

struct Level2 {
    flag: Bool;
    sub: Level3;
}

contract NestedOptionalContract {
    data: Level2?;

    init() {
        self.data = null;
    }
}
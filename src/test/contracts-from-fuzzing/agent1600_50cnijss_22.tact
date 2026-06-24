struct Level3 {
    leaf: Int;
}

struct Level2 {
    node: Level3?;
    flag: Bool;
}

struct Level1 {
    inner: Level2?;
    count: Int;
}

contract TestContract {
    data: Level1?;

    init() {
        self.data = null;
    }
}
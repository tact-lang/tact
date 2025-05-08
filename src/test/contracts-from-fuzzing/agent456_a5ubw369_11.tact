struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2;
}

contract NestedOptionals {
    val: Level1;

    init() {
        self.val = Level1 {
            inner: Level2 {
                inner: null
            }
        };
    }
}
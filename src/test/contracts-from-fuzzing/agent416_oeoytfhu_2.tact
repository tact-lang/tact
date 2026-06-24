struct Level3 {
    value: Int;
    flag: Bool;
}

struct Level2 {
    possibly: Level3?;
}

struct Level1 {
    inner: Level2;
}

contract Test3 {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner: Level2{
                possibly: null
            }
        };
    }
}

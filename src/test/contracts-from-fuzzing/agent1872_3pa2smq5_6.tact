struct Level3 {
    s: String;
}

struct Level2 {
    inner: Level3?;
    flag: Bool;
}

struct Level1 {
    n: Int;
    nested: Level2?;
}

contract NestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            n: 5,
            nested: null,
        };
    }
}
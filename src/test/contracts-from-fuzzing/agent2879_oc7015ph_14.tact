struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    mid: Level2;
    str: String?;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{
            mid: Level2{ inner: Level3{a: 5, b: false}, flag: true },
            str: null
        };
    }
}
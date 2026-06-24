struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    inner: Level3;
    opt: Int?;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract NestedStructContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                inner: Level3{x: 1, y: 2},
                opt: null
            },
            flag: true
        };
    }
}
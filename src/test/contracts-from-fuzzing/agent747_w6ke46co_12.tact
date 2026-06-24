struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
    opt: Level3?;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
    opt2: Level2?;
}

contract TestContract {
    bigNested: Level1;

    init() {
        self.bigNested = Level1{
            nested: Level2{
                inner: Level3{ val: 99 },
                opt: null
            },
            flag: true,
            opt2: null
        };
    }
}

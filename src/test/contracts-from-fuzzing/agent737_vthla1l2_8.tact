struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1?;
}

struct Level3 {
    l2: Level2;
    flag: Bool;
}

contract NestedOptStructs {
    data: Level3;

    init() {
        self.data = Level3{
            l2: Level2{
                l1a: Level1 { a: 42, b: false },
                l1b: null
            },
            flag: true
        };
    }
}
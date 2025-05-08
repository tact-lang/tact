struct Level3 {
    flag: Bool;
    count: Int;
    val: Int?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
    enabled: Bool;
}

struct Level1 {
    l2main: Level2;
    extra: Level2?
}

contract DeepTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2main: Level2{
                l3a: Level3{ flag: true, count: 1, val: null },
                l3b: Level3{ flag: false, count: 2, val: null },
                enabled: true,
            },
            extra: null,
        };
    }

    receive() {
        self.nested = Level1{
            l2main: Level2{
                l3a: Level3{ flag: false, count: 5, val: 55 },
                l3b: Level3{ flag: true, count: 6, val: 66 },
                enabled: false,
            },
            extra: null,
        };
    }
}
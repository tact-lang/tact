struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    l3: Level3;
    optStr: String?;
}

struct Level1 {
    l2: Level2;
    num: Int;
}

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    a: 7,
                    b: true,
                },
                optStr: null,
            },
            num: 55,
        };
    }
}
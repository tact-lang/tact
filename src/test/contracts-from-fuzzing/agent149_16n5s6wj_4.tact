struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
    optText: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepNestingTest {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    x: 99,
                },
                optText: null,
            },
            flag: false,
        };
    }
}
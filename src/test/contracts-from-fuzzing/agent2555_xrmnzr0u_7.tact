struct InnerMost {
    val: Int = 111;
    flag: Bool = true;
}

struct Level2 {
    item: InnerMost;
    note: String = "hi";
}

struct Level1 {
    sub: Level2;
    optText: String?;
}

contract NestingTest {
    root: Level1;

    init() {
        self.root = Level1{
            sub: Level2{
                item: InnerMost{ val: 222, flag: false },
                note: "deep"
            },
            optText: "done"
        };
    }
}
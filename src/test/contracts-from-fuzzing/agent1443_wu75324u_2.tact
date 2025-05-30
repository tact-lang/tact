struct Level3 {
    data: String;
    optFlag: Bool?;
}

struct Level2 {
    inner3: Level3;
    num: Int;
}

struct Level1 {
    inner2: Level2;
}

contract DeepNestedTest {
    state: Level1;

    init() {
        self.state = Level1{
            inner2: Level2{
                inner3: Level3{
                    data: "deep",
                    optFlag: true,
                },
                num: 123,
            }
        };
    }
}
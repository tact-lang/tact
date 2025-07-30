struct Level3 {
    deepVal: String = "deep";
    maybeNum: Int?;
}

struct Level2 {
    mid: Level3;
    flag: Bool = false;
}

struct Level1 {
    top: Level2;
    count: Int = 0;
}

contract DeepNestedTest {
    stuff: Level1 = Level1{
        top: Level2{
            mid: Level3{},
            flag: true
        },
        count: 5
    };

    init() {
        self.stuff = Level1{
            top: Level2{
                mid: Level3{ deepVal: "updated", maybeNum: 10 },
                flag: false
            },
            count: 7
        };
    }
}

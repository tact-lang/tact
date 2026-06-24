struct Level3 {
    val: Bool?;
    txt: String?;
}

struct Level2 {
    deep: Level3?;
    num: Int?;
}

struct Level1 {
    layer: Level2;
    flag: Bool;
}

contract OptNestedTest {
    stuff: Level1;

    init() {
        self.stuff = Level1{
            layer: Level2{
                deep: Level3{
                    val: true,
                    txt: "abc"
                },
                num: 42,
            },
            flag: true,
        };
    }
}
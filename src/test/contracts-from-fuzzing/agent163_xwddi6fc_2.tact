struct Level3 {
    val: Bool?;
}

struct Level2 {
    num: Int;
    l3: Level3;
}

struct Level1 {
    text: String;
    l2: Level2;
}

contract NestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            text: "deep",
            l2: Level2{
                num: 7,
                l3: Level3{val: true}
            }
        };
    }
}

struct Level3 {
    flag: Bool = true;
}

struct Level2 {
    l3: Level3 = Level3{};
    number: Int = 3;
}

struct Level1 {
    l2: Level2 = Level2{};
    text: String = "hi";
}

contract NestedTest {
    nested: Level1 = Level1{};

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{flag: false},
                number: 99},
            text: "changed"
        };
    }
}
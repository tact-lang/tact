struct DeepNest {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepTest {
    info: DeepNest;

    init() {
        self.info = DeepNest{
            level2: Level2{
                level3: Level3{a: 10, b: true, c: "nested"}
            }
        };
    }
}

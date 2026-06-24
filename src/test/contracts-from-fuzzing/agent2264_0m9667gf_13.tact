struct MultiLevel {
    level1: LevelA;
    level2: LevelB;
    level3: LevelC;
}

struct LevelA { a: Int; }
struct LevelB { b: Bool; }
struct LevelC { c: String; }

contract MultiTest {
    state: MultiLevel;

    init() {
        self.state = MultiLevel{
            level1: LevelA{a: 1},
            level2: LevelB{b: true},
            level3: LevelC{c: "str"}
        };
    }
}

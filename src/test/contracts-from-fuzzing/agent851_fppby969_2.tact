struct DeepNested { level1: Level1; }

struct Level1 { level2: Level2; optionalLevel2: Level2?; }

struct Level2 { level3: Level3; optionalLevel3: Level3?; }

struct Level3 { a: Int; b: Bool?; c: String; }

contract DeepNestedTest {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{ a: 1, b: null, c: "foo" },
                    optionalLevel3: null
                },
                optionalLevel2: null
            }
        };
    }
}
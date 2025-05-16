struct Level3 { v3a: Int; v3b: Bool; }

struct Level2 { v2a: Int; v2b: Level3; }

struct Level1 { v1a: Int; v1b: Level2; }

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            v1a: 1,
            v1b: Level2{
                v2a:2,
                v2b: Level3{
                    v3a:3,
                    v3b:true
                }
            }
        };
    }
}
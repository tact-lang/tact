struct Level3 { x: Int; }
struct Level2 { lvl3: Level3; }
struct Level1 { lvl2: Level2; }

contract DeepNestTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2: Level2{ lvl3: Level3{ x: 7 } }
        };
    }
}

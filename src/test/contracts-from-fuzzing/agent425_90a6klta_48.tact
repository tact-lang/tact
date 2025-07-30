// extremely deeply nested multi-level optional default cascade
struct Level3 { val: Int? = 7; }
struct Level2 { lvl3: Level3? = null; }
struct Level1 { lvl2: Level2? = null; }
contract Test {
    state: Level1 = Level1{};
}
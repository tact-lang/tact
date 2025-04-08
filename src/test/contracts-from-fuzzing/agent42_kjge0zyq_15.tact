struct Level3 { val: Int; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract NestedNulls {
    s: Level1;

    init() {
        self.s = Level1{
            l2: null
        };
    }
}
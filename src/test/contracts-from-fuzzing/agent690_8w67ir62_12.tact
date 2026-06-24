struct Level3 { val: Int; }
struct Level2 { level3: Level3; }
struct Level1 { level2: Level2; }

contract NestedChain {
    root: Level1;

    init() {
        self.root = Level1{level2: Level2{level3: Level3{val:0}}};
    }
}
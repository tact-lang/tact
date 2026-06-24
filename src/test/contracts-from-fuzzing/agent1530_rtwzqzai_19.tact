// Large nested struct chain

struct Level5 { val: Int; }
struct Level4 { l5: Level5; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ l5: Level5{ val: 123 } } } } };
    }
}

struct Level1 { l1: Int; }
struct Level2 { l2: Level1; }
struct Level3 { l3: Level2; }
struct Level4 { l4: Level3; }
struct Level5 { l5: Level4; }

contract TestContract {
    deeply: Level5;

    init() {
        self.deeply = Level5{ l5: Level4{ l4: Level3{ l3: Level2{ l2: Level1{ l1: 42 } } } } };
    }
}
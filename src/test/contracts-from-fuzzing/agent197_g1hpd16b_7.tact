struct Level4 { x: Bool = false; }
struct Level3 { l4: Level4 = Level4{ x: false }; }
struct Level2 { l3: Level3 = Level3{ l4: Level4{ x: false } }; }
struct Level1 { l2: Level2 = Level2{ l3: Level3{ l4: Level4{ x: false } } }; }

contract DeeplyNested {
    content: Level1 = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ x: false } } } };
}
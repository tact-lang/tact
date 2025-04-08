// Hugo nested chain with deep optional defaulting
struct Level3 { p: Int; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract TestContract {
    root: Level1 = Level1{ l2: null };
}
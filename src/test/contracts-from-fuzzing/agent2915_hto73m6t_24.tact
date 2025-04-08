struct Level3 { d: Int = 1; }
struct Level2 { c: Level3?; }
struct Level1 { b: Level2; }
struct Root { a: Level1; }

contract TestContract(root: Root) {}

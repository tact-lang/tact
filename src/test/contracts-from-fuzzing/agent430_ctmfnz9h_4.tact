struct Level2 {
    flag: Bool?;
    note: String?;
}

struct Level1 {
    ref: Level2?;
}

contract Test {
    state: Level1 = Level1{ ref: null };
}
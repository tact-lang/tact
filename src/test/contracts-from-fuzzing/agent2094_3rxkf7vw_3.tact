struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3?;
}

struct Level1 {
    x: Level2;
}

contract TestNested {
    data: Level1 = Level1{ x: Level2{ y: null } };
    receive() {}
}

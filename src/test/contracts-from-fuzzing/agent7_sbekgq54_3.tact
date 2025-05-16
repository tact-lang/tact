struct Level4 {
    a: Int;
}

struct Level3 {
    a: Int;
    b: Level4;
}

struct Level2 {
    a: Int;
    b: Level3;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract TestNestedStruct {
    receive(msg: Slice) {
        let nested: Level1 = Level1{ a: 1, b: Level2{ a: 2, b: Level3{ a: 3, b: Level4{ a: 4 } } } };
    }
}

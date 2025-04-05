struct Level1 {
    value: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

contract TestDeepStruct {
    receive() {
        // Construct a deeply nested structure
        let x: Level4 = Level4{ l3: Level3{ l2: Level2{ l1: Level1{ value: 42 } } } };
    }
}

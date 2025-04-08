struct Level3 {
    val3: Int;
}

struct Level2 {
    lvl3: Level3;
    opt3: Level3?;
}

struct Level1 {
    lvl2: Level2;
    opt2: Level2?;
}

contract OptionalNested {
    data: Level1 = Level1{
        lvl2: Level2{ lvl3: Level3{ val3: 42 }, opt3: null },
        opt2: null
    };
}
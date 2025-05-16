struct Level3 {
    f1: Int;
    f2: Bool;
}

struct Level2 {
    nested3: Level3;
    opt3: Level3?;
}

struct Level1 {
    nested2: Level2;
    opt2: Level2?;
}

contract ThreeLevel {
    data: Level1 = Level1{
        nested2: Level2 {
            nested3: Level3{ f1: 0, f2: false },
            opt3: null
        },
        opt2: null
    };
}
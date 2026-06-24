struct Level3 {
    leaf: Int?;
}

struct Level2 {
    mid: Level3?;
}

struct Level1 {
    top: Level2;
}

contract MixedNestedOptionals {
    root: Level1 = Level1{
        top: Level2{
            mid: null
        }
    };
}
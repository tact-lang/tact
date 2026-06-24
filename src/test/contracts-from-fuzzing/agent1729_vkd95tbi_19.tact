struct Level1 {
    intField: Int?;
    boolField: Bool?;
}

struct Level2 {
    l1a: Level1?;
    l1b: Level1?;
}

contract ChainOptionals {
    data: Level2?;
}
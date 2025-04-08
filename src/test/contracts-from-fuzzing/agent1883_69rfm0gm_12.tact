struct LevelTwo {
    data: Int;
}

struct LevelOne {
    inner: LevelTwo;
}

contract DeepOptional {
    nested: LevelOne?;
}
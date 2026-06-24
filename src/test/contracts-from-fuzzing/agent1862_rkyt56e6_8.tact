struct Level1 {
    val: Int?;
}

struct Level2 {
    inner: Level1?;
}

contract DeepNestedOptionals {
    data: Level2?;
}
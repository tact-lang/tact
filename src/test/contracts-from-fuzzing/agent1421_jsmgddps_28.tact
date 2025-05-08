struct Level2 {
    val: Int;
}

struct Level1 {
    child: Level2?;
}

contract NullDeep {
    field: Level1? = null;
}
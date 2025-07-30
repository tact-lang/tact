struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3?;
}

contract Test {
    optNested: Level2? = Level2{inner: null};
}

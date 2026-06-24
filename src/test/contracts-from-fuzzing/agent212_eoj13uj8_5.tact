struct Level2 {
    deep: Int?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    val: Level1? = null;
    init() {}
}
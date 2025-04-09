// Very deep contract persistent nested optionals (unusual nesting)
struct Level3 {
    val: Int?;
}
struct Level2 {
    level3: Level3?;
}
struct Level1 {
    level2: Level2?;
}

contract DeepOptionalNest {
    deep: Level1?;

    init() {
        self.deep = null;
    }
}
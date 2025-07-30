struct Level1 {
    val1: Int;
    val2: Bool;
}

struct Level2 {
    inner: Level1;
    text: String?;
}

contract ManyNestedOptionals {
    optLevel2: Level2?;

    init() {
        self.optLevel2 = null;
    }
}
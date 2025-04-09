struct Level3 {
    b: Bool?;
    s: String;
}

struct Level2 {
    inner: Level3?;
    val: Int;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    field: Level1;
    init() {
        self.field = Level1{
            nested: Level2{
                inner: null,
                val: 99
            }
        };
    }
}
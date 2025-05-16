struct Level2 {
    data: Int;
    opt: Bool?;
}

struct Level1 {
    val: Int;
    nested: Level2;
}

contract Test {
    field: Level1;

    init() {
        self.field = Level1{
            val: 7,
            nested: Level2{
                data: 42,
                opt: true
            }
        };
    }
}
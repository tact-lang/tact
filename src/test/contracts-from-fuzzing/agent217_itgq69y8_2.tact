struct Level2 {
    flag: Bool;
    val: Int?;
}

struct Level1 {
    nested: Level2;
    text: String?;
}

contract NestedOptionalTest {
    field: Level1;

    init() {
        self.field = Level1{
            nested: Level2{flag: true, val: null},
            text: null,
        };
    }
}
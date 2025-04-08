struct Level3 {
    val: String;
}

struct Level2 {
    opt: Level3?;
}

struct Level1 {
    nested: Level2;
}

contract DeepOptionalTest {
    field: Level1;

    init() {
        self.field = Level1{
            nested: Level2{
                opt: null
            }
        };
    }
}
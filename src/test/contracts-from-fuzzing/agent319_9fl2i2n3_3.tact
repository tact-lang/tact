struct Level3 {
    a: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeeplyNestedStructs {
    field: Level1;

    init() {
        self.field = Level1{
            inner: Level2{
                inner: Level3{
                    a: 123,
                }
            }
        };
    }
}

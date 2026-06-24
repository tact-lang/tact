struct Level2 {
    z: Int?;
    w: Int;
}

struct Level1 {
    nested: Level2;
    val: Int;
}

contract DeepNestedOptional {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                z: null,
                w: 11
            },
            val: 5
        };
    }
}
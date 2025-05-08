struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    deep: Level3;
}

struct Level1 {
    x: Int;
    deeper: Level2;
}

contract DeepNestedContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: 1,
            deeper: Level2{
                y: 2,
                deep: Level3{z:3}
            }
        };
    }
}
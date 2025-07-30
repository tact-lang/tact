struct Level3 {
    z: Int?;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestedOptional {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    z: null
                }
            }
        };
    }
}
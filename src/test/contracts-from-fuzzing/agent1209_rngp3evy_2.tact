struct Level3 {
    deep: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    middle: Level2;
}

contract DeepNestedContract {
    data: Level1;
    init() {
        self.data = Level1{
            middle: Level2{
                inner: Level3{
                    deep: 777
                }
            }
        };
    }
}
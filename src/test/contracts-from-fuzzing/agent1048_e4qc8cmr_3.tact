struct Level3 {
    z: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            nested: Level2{
                inner: Level3{
                    z: 123
                }
            }
        };
    }
}
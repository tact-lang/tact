struct DeepNest {
    inner: Level1;
}

struct Level1 {
    inner: Level2;
}

struct Level2 {
    inner: Level3;
}

struct Level3 {
    innerField: Int;
}

contract TestContract {
    value: DeepNest = DeepNest{
        inner: Level1{
            inner: Level2{
                inner: Level3{
                    innerField: 123
                }
            }
        }
    };
    receive() {}
}
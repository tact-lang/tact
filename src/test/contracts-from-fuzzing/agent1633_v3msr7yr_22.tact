struct Level1 {
    val: Int;
}
struct Level2 {
    inner: Level1;
}
struct Level3 {
    inner: Level2;
}
struct Level4 {
    inner: Level3;
}
struct Level5 {
    inner: Level4;
}

contract NestedLevels {
    storage: Level5;

    init() {
        self.storage = Level5{
            inner: Level4{
                inner: Level3{
                    inner: Level2{
                        inner: Level1{
                            val: 2023
                        }
                    }
                }
            }
        };
    }
}
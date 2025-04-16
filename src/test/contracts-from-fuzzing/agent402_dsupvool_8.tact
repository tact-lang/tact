struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    nestedOpt: Level1? = null;

    init() {
        self.nestedOpt = Level1{
            inner: Level2{
                inner: Level3{
                    val: 99,
                },
            },
        };
    }
}
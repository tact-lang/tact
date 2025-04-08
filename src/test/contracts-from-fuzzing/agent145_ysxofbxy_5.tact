struct Level3 {
    val3: Int;
}

struct Level2 {
    opt: Level3?;
}

struct Level1 {
    nestedOpt: Level2?;
    val1: Int;
}

contract NestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            nestedOpt: Level2{
                opt: Level3{ val3: 42 }
            },
            val1: 7
        };
    }
}
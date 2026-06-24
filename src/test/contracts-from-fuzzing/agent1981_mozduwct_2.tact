struct Level3 {
    deepField: Bool;
}

struct Level2 {
    nestedOpt: Level3?;
    val: Int;
}

struct Level1 {
    inner: Level2;
    optInner: Level2?;
}

contract DeepNestTest {
    field: Level1;

    init() {
        self.field = Level1{
            inner: Level2{nestedOpt: null, val: 1},
            optInner: null
        };
    }
}
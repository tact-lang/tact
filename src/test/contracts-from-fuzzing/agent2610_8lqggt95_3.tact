struct OptionalNested {
    level1: Level1?;
}

struct Level1 {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    storage: OptionalNested;
    init() {
        self.storage = OptionalNested{
            level1: Level1{
                inner: Inner{val: 42}
            }
        };
    }
}

struct OptionalDeepNest {
    inner: Level1?;
}

struct Level1 {
    inner2: Level2?;
}

struct Level2 {
    value: Int?;
}

contract DeepOptionals {
    s: OptionalDeepNest = OptionalDeepNest{inner: null};

    init() {
        self.s.inner = Level1{inner2: Level2{value: 42}};
    }
}
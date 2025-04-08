struct Level1 {
    optInner: Level2?;
}

struct Level2 {
    optInner2: Level3?;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            optInner: Level2{
                optInner2: null,
            },
        };
    }

    receive() {
        let _ = self.nested.optInner;
    }
}
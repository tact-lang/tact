struct InnerMost {
    value: Int;
}

struct Level2 {
    x: InnerMost;
    y: Int;
}

struct Level1 {
    first: Level2;
    second: Level2;
    opt: InnerMost?;
}

contract TestContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            first: Level2{ x: InnerMost{value: 1}, y: 2 },
            second: Level2{ x: InnerMost{value: 3}, y: 4 },
            opt: null,
        };
    }
}
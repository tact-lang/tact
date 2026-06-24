struct Level3 {
    deepValue: Int;
}

struct Level2 {
    maybeDeep: Level3?;
}

struct Level1 {
    nestedOpt: Level2?;
}

contract DoubleOptional {
    data: Level1;

    init() {
        self.data = Level1{
            nestedOpt: null,
        };
    }
}
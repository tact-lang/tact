struct Level3 {
    x: Int;
}

struct Level2 {
    opt3: Level3?;
}

struct Level1 {
    opt2: Level2?;
}

contract NestedNullableStructs {
    store: Level1;

    init() {
        self.store = Level1{
            opt2: Level2{
                opt3: null,
            },
        };
    }
}
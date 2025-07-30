struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    deep: Level3?;
}

struct Level1 {
    x: Int;
    nested: Level2?;
}

contract OptionalNest {
    payload: Level1;

    init() {
        self.payload = Level1{
            x: 1,
            nested: Level2{
                y: 2,
                deep: Level3{
                    z: 3,
                },
            },
        };
    }
}
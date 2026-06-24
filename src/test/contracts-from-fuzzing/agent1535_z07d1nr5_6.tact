struct Level3 {
    z: Int;
}

struct Level2 {
    inner: Level3;
    y: Bool;
}

struct Level1 {
    nested: Level2;
    x: String;
}

contract Deep3NestStorage {
    top: Level1 = Level1{
        nested: Level2{
            inner: Level3{z: 999},
            y: true,
        },
        x: "deep",
    };
}

struct Level3 {
    v: Int = 42;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    field: Level1 = Level1{
        inner: null,
    };

    init() {}
}
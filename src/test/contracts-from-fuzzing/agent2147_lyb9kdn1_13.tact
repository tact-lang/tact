struct Level3 {
    z: Int = 100;
}

struct Level2 {
    mid: Level3?;
    note: String = "hi";
}

struct Level1 {
    deep: Level2?;
    count: Int = 1;
}

contract ChainNulls {
    data: Level1 = Level1{
        deep: null,
        count: 42
    };
}
struct Level2 {
    a: Int = 5;
    b: String = "b";
}

struct Level1 {
    l2: Level2;
    c: Int? = null;
}

contract MixDefaults {
    field: Level1 = Level1{ l2: Level2{} };
}
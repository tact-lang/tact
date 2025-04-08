struct Level3 {
    deepVal: Int? = null;
}

struct Level2 {
    nested: Level3 = Level3{};
}

struct Level1 {
    mid: Level2;
    word: String = "hi";
}

contract ParamsWithDefaults(
    p: Level1,
) {
    receive() {}
}
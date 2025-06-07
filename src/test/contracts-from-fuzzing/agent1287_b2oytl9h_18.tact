struct Level1 {
    value: Int;
}

struct Level2 {
    maybe: Level1? = null;
}

contract NestedOptionalStructDefault {
    s: Level2 = Level2{};
}
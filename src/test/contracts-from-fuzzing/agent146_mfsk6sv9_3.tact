struct Level2 {
    foo: Int;
}

struct Level1 {
    bar: Level2;
}

contract Nested {
    data: Level1 = Level1{ bar: Level2{ foo: 42 } };
}
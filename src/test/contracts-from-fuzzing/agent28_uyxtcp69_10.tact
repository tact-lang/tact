struct Level2 {
    foo: Int;
}

struct Level1 {
    nested: Level2?;
    bar: String;
}

contract NestedOptParam(
    param: Level1,
) {}
struct Level2 {
    c: String;
    d: Int;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract NestedParam(
    param: Level1,
) {}

contract Dummy {receive(){}}
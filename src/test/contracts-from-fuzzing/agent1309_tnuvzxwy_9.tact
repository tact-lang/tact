struct Layer3 {
    d: Int?;
}

struct Layer2 {
    c: Layer3?;
}

struct Layer1 {
    b: Layer2?;
}

contract NestedOptionalDeep {
    nested: Layer1?;
}
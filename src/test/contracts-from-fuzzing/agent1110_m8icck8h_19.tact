struct Leaf {
    v: Int? as uint8;
}

struct Middle {
    flag: Bool?;
    leaf: Leaf;
}

struct Root {
    id: Int;
    nested: Middle;
}

contract TestContract(
    state: Root,
) {}
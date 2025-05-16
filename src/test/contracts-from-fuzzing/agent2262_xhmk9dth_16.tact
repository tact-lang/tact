struct Leaf {
    foo: Int as int4;
    bar: Bool?;
}

struct Node {
    a: Leaf;
    b: Int as uint8;
}

contract Test(
    root: Node,
    maybe: Leaf?,
    count: Int as uint16,
    flag: Bool,
    label: String?,
) {}
struct Leaf {
    a: Int as int32;
    b: Bool;
}

struct Branch {
    x: Int as uint8;
    leaf: Leaf;
}

contract PersistWithSerialization {
    br: Branch;

    init() {
        self.br = Branch{
            x: 255,
            leaf: Leaf{ a: -1234, b: true }
        };
    }
}
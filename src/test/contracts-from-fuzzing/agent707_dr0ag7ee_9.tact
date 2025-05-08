struct Leaf {
    x: Int as uint3;
    y: Int as int4;
    z: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract OptSerializationMix {
    data: Branch?;

    init() {
        self.data = Branch{
            leaf: Leaf{
                x: 7,     // max of uint3
                y: -8,    // min of int4
                z: 12345,
            }
        };
    }
}
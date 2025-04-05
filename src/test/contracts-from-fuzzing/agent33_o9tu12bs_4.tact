struct L5 {
    v: Int;
}

struct L4 {
    v: Int;
    nested: L5;
}

struct L3 {
    v: Int;
    nested: L4;
}

struct L2 {
    v: Int;
    nested: L3;
}

struct L1 {
    v: Int;
    nested: L2;
}

contract DeepNested {
    receive() {
        let node: L1 = L1{
            v: 1,
            nested: L2{
                v: 2,
                nested: L3{
                    v: 3,
                    nested: L4{
                        v: 4,
                        nested: L5{
                            v: 5
                        }
                    }
                }
            }
        };

        let total: Int = node.v + node.nested.v + node.nested.nested.v + node.nested.nested.nested.v + node.nested.nested.nested.nested.v;
    }
}

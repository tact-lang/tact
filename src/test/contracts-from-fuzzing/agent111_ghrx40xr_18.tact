// Nested struct with serialization specifiers deeply nested
struct SLeaf {
    u: Int as uint8;
    b: Bool;
}

struct SNode {
    left: SLeaf;
    right: SLeaf;
}

struct SRoot {
    node: SNode;
    val: Int as int16;
}

contract SerializeNest {
    data: SRoot;
    init() {
        self.data = SRoot{
            node: SNode{
                left: SLeaf{u:1,b:true},
                right: SLeaf{u:2,b:false}
            },
            val: -3
        };
    }
}
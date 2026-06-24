// Contract with deeply nested structs, and very wide leaf node
struct Leaf {
    a:Int; b:Int; c:Int; d:Int; e:Int;
    f:Int; g:Int; h:Int; i:Int; j:Int;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract DeepWide {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                leaf: Leaf{
                    a:1,b:2,c:3,d:4,e:5,
                    f:6,g:7,h:8,i:9,j:10
                }
            }
        };
    }
}
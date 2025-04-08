// deeply nested + lots optional primitives inside nested struct
struct Leaf {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    middle: Mid;
}

contract DeepOpt {
    field: Top;

    init() {
        self.field = Top{
            middle: Mid{
                leaf: Leaf{
                  a:null,b:null,c:null,d:null,e:null,f:null
                }
            }
        };
    }
}
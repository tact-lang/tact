struct Leaf {
    finalVal: Int;
}

struct Mid2 {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Mid1 {
    mid2a: Mid2;
    mid2b: Mid2;
}

struct Root {
    mid1: Mid1;
}

contract TreeStruct {
    root: Root;

    init() {
        self.root = Root{
            mid1: Mid1{
                mid2a: Mid2{
                    leaf1: Leaf{finalVal: 1},
                    leaf2: Leaf{finalVal: 2}
                },
                mid2b: Mid2{
                    leaf1: Leaf{finalVal: 3},
                    leaf2: Leaf{finalVal: 4}
                }
            }
        };
    }
}
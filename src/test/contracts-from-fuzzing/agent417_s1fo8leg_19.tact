struct Leaf {
    z: Int;
}

struct Mid2 {
    y: Int;
    leaf: Leaf;
}

struct Mid1 {
    x: Int;
    mid2: Mid2;
}

struct Root {
    w: Int;
    mid1: Mid1;
}

contract TestContract {
    root: Root;
    
    init() {
        self.root = Root{
            w: 0,
            mid1: Mid1{
                x: 1,
                mid2: Mid2{
                    y: 2,
                    leaf: Leaf{
                        z: 3
                    }
                }
            }
        };
    }
}
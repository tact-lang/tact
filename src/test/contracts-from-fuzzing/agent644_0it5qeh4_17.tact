struct Leaf { x: Int; y: Bool?; z: String; }

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    a: Branch;
    b: Branch;
}

contract Test {
    root: Root;

    init() {
        self.root = Root{
            a: Branch{
                left: Leaf{x:1,y:true,z:"L1"},
                right: Leaf{x:2,y:null,z:"R1"}
            },
            b: Branch{
                left: Leaf{x:3,y:false,z:"L2"},
                right: Leaf{x:4,y:true,z:"R2"}
            }
        };
    }
}
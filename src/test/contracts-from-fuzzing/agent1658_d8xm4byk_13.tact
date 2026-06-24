struct Leaf { x: Int; y: Int; z: Int; }

struct Branch {
    a: Leaf;
    b: Leaf;
    c: Leaf;
}

struct Root {
    left: Branch;
    right: Branch;
}

contract StorageTest {
    tree: Root;

    init() {
        self.tree = Root{
            left: Branch{
                a: Leaf{ x:1,y:2,z:3 },
                b: Leaf{ x:4,y:5,z:6 },
                c: Leaf{ x:7,y:8,z:9 }
            },
            right: Branch{
                a: Leaf{ x:10,y:11,z:12 },
                b: Leaf{ x:13,y:14,z:15 },
                c: Leaf{ x:16,y:17,z:18 }
            }
        };
    }
}
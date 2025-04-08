struct Leafs {
    leafA: Int;
    leafB: Bool;
    leafC: String;
}

struct Branch {
    sub1: Leafs;
    sub2: Leafs;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract Tree {
    tree: Root;

    init() {
        self.tree = Root{
            branch1: Branch{
                sub1: Leafs{leafA:1, leafB:true, leafC:"a"},
                sub2: Leafs{leafA:2, leafB:false, leafC:"b"}
            },
            branch2: Branch{
                sub1: Leafs{leafA:3, leafB:true, leafC:"c"},
                sub2: Leafs{leafA:4, leafB:false, leafC:"d"}
            }
        };
    }
}
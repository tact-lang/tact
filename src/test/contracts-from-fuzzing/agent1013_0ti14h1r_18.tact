struct LeafOpt {
    x: Int?;
    y: Bool?;
}

struct NodeOpt {
    leaf1: LeafOpt;
    leaf2: LeafOpt;
}

contract OptNest {
    dat: NodeOpt;

    init() {
        self.dat = NodeOpt{
            leaf1: LeafOpt{x:null, y:null},
            leaf2: LeafOpt{x:1, y:true}
        };
    }
}

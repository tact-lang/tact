struct Leaf {
    f: Int; op: Int?; s: String; so: String?; b: Bool; bo: Bool?;
}

struct Branch {
    l: Leaf;
    r: Leaf;
}

contract Tree {
    root: Branch;

    init() {
        self.root = Branch{
            l: Leaf{ f:1, op:null, s:"a", so:null, b:true, bo:null },
            r: Leaf{ f:2, op:3, s:"b", so:"s", b:false, bo:true }
        };
    }
}

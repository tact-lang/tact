// Mutually nested structs with optional bottom level
struct Leaf {
    dat: Int?;
}

struct Branch {
    leaf: Leaf;
    comment: String;
}

struct Tree {
    branch: Branch;
    label: String;
}

contract Forest {
    t: Tree;

    init() {
        self.t = Tree{
            branch: Branch{
                leaf: Leaf{ dat:null },
                comment: "hi"
            },
            label: "id"
        };
    }

    receive() {
        self.t = self.t;
    }
}
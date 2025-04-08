// chain of structs with optionals deep inside
struct Leaf {
    x: Int?;
    y: String?;
}

struct Branch {
    leaf: Leaf;
}

struct Tree {
    branch: Branch;
    label: String;
}

contract TreeTest {
    t: Tree;

    init() {
        self.t = Tree{
            branch: Branch{
                leaf: Leaf{
                    x: null,
                    y: null,
                }
            },
            label: "root",
        };
    }
}
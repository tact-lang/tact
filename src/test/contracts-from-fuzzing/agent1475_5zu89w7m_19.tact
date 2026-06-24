struct Leaf1 {
    x: Int;
}
struct Leaf2 {
    y: Bool;
}

struct Branch {
    l1: Leaf1;
    l2: Leaf2;
}

contract TreeStorage {
    branch: Branch;

    init() {
        self.branch = Branch{
            l1: Leaf1{x: 11},
            l2: Leaf2{y: true},
        };
    }
}
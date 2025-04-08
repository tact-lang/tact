// test edge: deeply nested + optional persists
struct Leaf { val: Int?; }
struct Branch { leaf: Leaf; }
struct Tree { branch: Branch; }

contract TestContract {
    t: Tree;
    init() {
        self.t = Tree{branch: Branch{leaf: Leaf{val: null}}};
    }
}
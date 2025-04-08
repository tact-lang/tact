struct Leaf { val: Int? }
struct Branch { leaf1: Leaf; leaf2: Leaf? }
struct Tree { left: Branch; right: Branch? }

contract NestedOptionalComplex {
    t: Tree;

    init() {
        self.t = Tree {
            left: Branch {
                leaf1: Leaf{ val: 42 },
                leaf2: null
            },
            right: null
        };
    }
}
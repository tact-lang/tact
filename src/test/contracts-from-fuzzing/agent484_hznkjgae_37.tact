struct Leaf { leafVal: Int }
struct Branch { leaf: Leaf }
struct Tree { branch: Branch? }

contract HiddenUnset {
    t: Tree;

    init() {
        self.t = Tree{
            branch: null
        };
    }
}
struct Leaf { val: Int = 1; }
struct Branch { lf1: Leaf?; lf2: Leaf?; }
struct Tree { br: Branch; }

contract Forest {
    state: Tree;

    init() {
        self.state = Tree{
            br: Branch{
                lf1: null,
                lf2: null,
            }
        };
    }
}
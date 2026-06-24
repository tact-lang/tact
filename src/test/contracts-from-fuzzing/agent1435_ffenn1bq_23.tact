struct Leaf { x: Int? = null; }
struct Branch { leaf: Leaf? = null; }
struct Tree { branch: Branch? = null; }

contract Forest {
    t: Tree?;
    init() {
        self.t = null;
    }
}
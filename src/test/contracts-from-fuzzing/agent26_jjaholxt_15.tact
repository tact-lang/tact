struct Leaf { value: Int }
struct Branch { l: Leaf; name: String }
struct Tree { left: Branch; right: Branch }

contract TreeTest {
    t: Tree;
    init() {
        self.t = Tree{
            left: Branch{ l: Leaf{ value: 1 }, name: "L" },
            right: Branch{ l: Leaf{ value: 2 }, name: "R" }
        };
    }
}
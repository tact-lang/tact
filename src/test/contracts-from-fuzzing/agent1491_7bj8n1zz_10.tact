struct Leaf { l: Int }
struct Branch { leaf: Leaf }
struct Tree { branch: Branch }

contract TestContract {
    data: Tree?;
    init() {
        self.data = Tree {
            branch: Branch {
                leaf: Leaf { l: 123 }
            }
        };
    }
}
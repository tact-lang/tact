struct Leaf { l: Int }
struct Branch { leaf: Leaf }
struct Tree { branch: Branch }

contract TestContract {
    data: Tree?;
    init() {
        self.data = null;
    }
}
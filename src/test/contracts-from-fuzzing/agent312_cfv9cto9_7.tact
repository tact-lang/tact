struct Leaf { x: Int }

struct Branch { leaf: Leaf? }

contract TestContract {
    branch: Branch?;

    init() {
        self.branch = null;
    }
}
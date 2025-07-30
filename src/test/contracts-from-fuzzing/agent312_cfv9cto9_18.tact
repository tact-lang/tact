struct Leaf { v: Int?; }
struct Branch { leaf: Leaf?; }

contract TestContract {
    root: Branch?;
    init() { self.root = null; }
}
struct Leaf { z: Int?; }
struct Branch { leaf: Leaf? = null; }
struct Root { branch: Branch? = null; }

contract NullDefaults {
    root: Root;
    init() {
        self.root = Root{};
    }
}
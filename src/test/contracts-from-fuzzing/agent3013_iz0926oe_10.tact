// optional deeply nested
struct Leaf { x: Int; }
struct Branch { leaf: Leaf?; }
struct Trunk { branch: Branch?; }

contract Tree {
    trunk: Trunk;

    init() {
        self.trunk = Trunk { branch: null };
    }
}

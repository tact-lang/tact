// contract with many layers of nested struct without optionals
struct Leaf { z: Int; }
struct Middle { y: Leaf; }
struct Root { x: Middle; }

contract MultiNest {
    root: Root;

    init() {
        self.root = Root{ x: Middle { y: Leaf{z:777} } };
    }
}
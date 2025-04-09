// contract with optional struct containing optional nested struct containing optional primitives
struct Leaf { x: Int?; y: Bool?; }
struct Node { left: Leaf?; tag: String; }

contract VeryNestedOptional {
    root: Node?;

    init() {
        self.root = null;
    }
}
// optional chain top-level
struct Leaf { v: Int; }
struct Node { leaf: Leaf?; }
contract TopOpt {
    chain: Node?;
    init() {
        self.chain = null;
    }
}
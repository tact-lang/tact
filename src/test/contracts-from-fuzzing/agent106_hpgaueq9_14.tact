// Struct inside optional, which itself contains optional primitive
struct Leaf { a: Int?; b: Bool; }

contract OptWrapper {
    leaf: Leaf? = null;

    init() {
        self.leaf = Leaf{ a: 7, b: true };
    }

    receive() {}
}
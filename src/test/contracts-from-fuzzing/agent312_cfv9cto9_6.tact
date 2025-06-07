struct Leaf { v: Int }

struct Mid { leaf: Leaf? }

struct Root { mid: Mid }

contract TestContract {
    root: Root;

    init() {
        self.root = Root{ mid: Mid{ leaf: null } };
    }
}
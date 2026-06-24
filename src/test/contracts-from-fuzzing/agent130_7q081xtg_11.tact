// Contract using nested optionals inside nested structs
struct Leaf {
    val: Int?;
}

struct Middle {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    mid: Middle?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{ mid: Middle{ left: null, right: Leaf{ val: null } } };
    }

    receive() {
        self.root = self.root;
    }
}
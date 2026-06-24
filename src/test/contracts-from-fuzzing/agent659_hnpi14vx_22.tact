struct Leaf {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    leaf: Leaf?;
}

contract TestContract {
    state: Container?;

    init() {
        self.state = null;
    }
}
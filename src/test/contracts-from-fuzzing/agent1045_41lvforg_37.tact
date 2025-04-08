struct Leaf {
    a: Int = 7;
    b: Bool? = null;
}

struct Middle {
    leaf: Leaf?;
}

contract TestContract {
    state: Middle;

    init() {
        self.state = Middle{
            leaf: null
        };
    }
}
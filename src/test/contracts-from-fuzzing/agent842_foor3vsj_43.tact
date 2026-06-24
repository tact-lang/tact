struct Leaf {
    value: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Container {
    child: Node?;
}

contract DeepOptionalChain {
    state: Container?;

    init() {
        self.state = null;
    }

    receive() {
        let _=self.state;
    }
}
struct Leaf {
    x: Int? as uint32;
    y: Int? as uint64;
}

struct Node {
    leaf: Leaf?;
}

contract OptStructSerialTest {
    nest: Node?;

    init() {
        self.nest = Node{
            leaf: Leaf{
                x: 1,
                y: null
            }
        };
    }

    receive() {
        self.nest = null;
    }
}
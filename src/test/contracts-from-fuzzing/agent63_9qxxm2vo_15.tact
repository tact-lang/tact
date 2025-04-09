struct Leaf {
    small: Int as uint4;
    flag: Bool;
}

struct Node {
    data: Leaf?;
    count: Int;
}

contract MixedNested {
    value: Node;

    init() {
        self.value = Node{
            data: Leaf{ small: 7, flag: true },
            count: 42
        };
    }
}
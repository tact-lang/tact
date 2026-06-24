struct Leaf1 {
    id: Int;
}

struct Leaf2 {
    id: Int;
    payload: String;
}

struct TopNode {
    branch1: Leaf1?;
    branch2: Leaf2?;
}

contract OptionalBranches {
    topNode: TopNode = TopNode{
        branch1: Leaf1{id: 1},
        branch2: null
    };
}
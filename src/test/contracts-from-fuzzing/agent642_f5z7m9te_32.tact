// nested multiple levels, optionals at every level
struct Leaf {v:Int?;}
struct Node2 {leaf: Leaf?;}
struct Node1 {node2: Node2?;}
struct Root {node1: Node1?;}

contract MultiLevelOpt {
    persist: Root;

    init() {
        self.persist = Root { node1:null };
    }
}
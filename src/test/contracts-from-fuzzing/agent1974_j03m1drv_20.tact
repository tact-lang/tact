struct Node {
    val: Int;
    next: Int?;
    flag: Bool;
}

contract ManyNodes {
    n1: Node;
    n2: Node;
    n3: Node;
    n4: Node;

    init() {
        self.n1 = Node{ val:1, next:null, flag:true };
        self.n2 = Node{ val:2, next:3, flag:false };
        self.n3 = Node{ val:3, next:null, flag:true };
        self.n4 = Node{ val:4, next:null, flag:false };
    }
}

// repeated nested persistent structs
struct Node {
    left: Int;
    right: Int;
}

contract TestContract {
    n1: Node;
    n2: Node;
    n3: Node;
    init() {
        self.n1=Node{left:1,right:2};
        self.n2=Node{left:3,right:4};
        self.n3=Node{left:5,right:6};
    }
}
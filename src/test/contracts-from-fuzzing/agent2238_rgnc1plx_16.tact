struct Edge {
    a: Int = 1;
    b: Bool;
    c: String?;
}

contract TestContract {
    x: Edge;

    init() {
        self.x = Edge{b:true,c:null};
    }
}

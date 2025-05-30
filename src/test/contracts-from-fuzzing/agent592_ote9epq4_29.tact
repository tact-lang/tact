struct Edge {
    a: Int as uint8 = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "x";
    f: String?;
}

contract TestContract {
    s: Edge;

    init() {
        self.s = Edge{ b:null, d:null, f:null };
    }

    receive() {}
}
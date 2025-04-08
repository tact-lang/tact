struct Edge {
    a: Int as uint8 = 5;
    b: Bool;
    c: Int? = null;
    d: Bool? = null;
    e: Int as int16 = -12;
    f: String = "txt";
}

contract TestContract {
    edge: Edge;

    init() {
        self.edge = Edge{ b: true, e: -200, f: "zzz" };
    }
}
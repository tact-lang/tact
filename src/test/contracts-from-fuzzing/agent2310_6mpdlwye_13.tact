struct Leaf { v: Int; }
struct MiddleOpt { leaf: Leaf?; }
struct Root {
    m1: MiddleOpt?;
    m2: MiddleOpt?;
}

contract Tree {
    data: Root;
    init() {
        self.data = Root{ m1: null, m2: null };
    }
}
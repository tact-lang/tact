struct N {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract MultipleNulls {
    n1: N?;
    n2: N?;
    n3: N?;
    init() {
        self.n1 = null;
        self.n2 = null;
        self.n3 = null;
    }
}
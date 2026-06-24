struct OptLayer {
    a: Int?;
    b: String?;
}

struct NestedOptLayer {
    n: OptLayer?;
}

contract OptLayered {
    f: NestedOptLayer;

    init() {
        self.f = NestedOptLayer{ n:null };
    }
}

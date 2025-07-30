struct NestedOpt {
    inner1: Int?;
    inner2: Bool?;
}

contract TestContract {
    n1: NestedOpt;
    n2: NestedOpt;

    init() {
        self.n1 = NestedOpt{ inner1: null, inner2: true };
        self.n2 = NestedOpt{ inner1: 42, inner2: null };
    }
}
struct SOpt {
    s: Int?;
}

struct WrapperOpt {
    inside: SOpt?;
}

contract Test {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{ inside: null };
    }
}
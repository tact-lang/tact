struct OptLeaf {
    s: String?;
}

struct MidOpt {
    leaf: OptLeaf?;
    a: Int?;
    flag: Bool;
}

contract ImplicitNulls {
    data: MidOpt;

    init() {
        self.data = MidOpt{
            leaf: null,
            a: null,
            flag: false
        };
    }
}
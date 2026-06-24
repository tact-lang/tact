struct InnerOpt {
    z: Bool?;
    w: String?;
}

struct NestedOpt {
    x: Int?;
    y: InnerOpt;
}

contract Test {
    d: NestedOpt;

    init() {
        self.d = NestedOpt {
            x: null,
            y: InnerOpt{ z:null, w:null }
        };
    }
}
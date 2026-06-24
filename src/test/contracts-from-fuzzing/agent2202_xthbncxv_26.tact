// optional contract field nested in optional struct
struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    io: InnerOpt?;
}

contract NestedTwoOpt {
    v: OuterOpt?;

    init() {
        self.v = null;
    }
}
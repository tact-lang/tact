struct InnerMost {
    val: Int
}

struct MidOpt {
    sub: InnerMost?
}

struct OuterOpt {
    layer: MidOpt?
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            layer: MidOpt{ sub: InnerMost{ val: 7 } }
        };
    }
}
struct Outer {
    f1: Int;
    f2: Inner;
}

struct Inner {
    g1: Bool;
    g2: String;
}

contract NestedRefs {
    data: Outer;
    init() {
        self.data = Outer{
            f1:1,
            f2: Inner{ g1:true, g2:"hi" }
        };
    }
}
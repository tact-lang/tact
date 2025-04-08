struct NestedDeep2 {
    n1: NestedDeep1;
}

struct NestedDeep1 {
    s: NestedInner;
}

struct NestedInner {
    x: Int;
    y: Bool;
    z: String;
}

contract ChainNested {
    f: NestedDeep2;
    init() {
        self.f = NestedDeep2{
            n1: NestedDeep1{
                s: NestedInner{
                    x: 42,
                    y: true,
                    z: "deep"
                }
            }
        };
    }
}
struct NestedMulti {
    s1: S1;
    s2: S2;
    deep: DeepOpt;
}

struct S1 { x: Int }
struct S2 { x: Bool }
struct OptInner { a: Int?; b: Bool? }
struct DeepOpt { innerOpt: OptInner?; val: Int }

contract ComplexFields {
    data: NestedMulti;

    init() {
        self.data = NestedMulti{
            s1: S1{x:13},
            s2: S2{x:false},
            deep: DeepOpt{innerOpt: null, val: 77}
        };
    }
}
struct NestedArray1 {
    a: InnerOpt;
    b: InnerOpt;
    c: InnerOpt;
}

struct InnerOpt {
    one: Int?;
    two: Bool?;
    deep: InnerInner?;
}

struct InnerInner {
    x: Int;
    y: Int?;
}

contract Test {
    record: NestedArray1;

    init() {
        self.record = NestedArray1{
            a: InnerOpt{one:null, two:null, deep:null},
            b: InnerOpt{one:null, two:null, deep:null},
            c: InnerOpt{one:null, two:null, deep:null},
        };
    }
}
struct InnerComplex {
    d: Int;
    e: Bool;
}

struct DeepComplex {
    a: Int;
    b: Bool;
    c: InnerComplex;
}

contract NestedNamed {
    data: DeepComplex;

    init() {
        self.data = DeepComplex{a:1, b:true, c: InnerComplex{d:42,e:false}};
    }
}
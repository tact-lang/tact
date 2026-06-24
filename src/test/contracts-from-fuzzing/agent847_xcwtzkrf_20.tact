struct NestedMultipleOpt {
    a: Int?;
    b: InnerOpt?;
    c: Bool?;
}

struct InnerOpt {
    z: Int?;
}

contract ManyNestedOpt {
    s: NestedMultipleOpt;

    init() {
        self.s = NestedMultipleOpt{ a:null, b:null, c:null };
    }
}
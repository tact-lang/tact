struct OuterOpt {
    a: Int;
    b: InnerOpt?;
}

struct InnerOpt {
    c: Int;
    d: Bool?;
}

contract OptInOpt {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{a: 5, b: null};
    }
}
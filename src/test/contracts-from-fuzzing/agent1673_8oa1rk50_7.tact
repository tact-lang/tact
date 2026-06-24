struct InnerOpt {
    x: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    y: Int?;
}

contract OptDefaultComplex {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{inner: null, y: null};
    }
}
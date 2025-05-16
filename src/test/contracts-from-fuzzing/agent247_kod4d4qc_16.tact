struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct Cont {
    inner: InnerOpt?;
}

contract OptNest {
    val: Cont;
    init() {
        self.val = Cont{ inner: null };
    }
}
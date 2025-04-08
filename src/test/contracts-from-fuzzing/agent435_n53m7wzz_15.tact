struct SOpt {
    a: Int?;
    b: Bool?;
}

struct MOpt {
    sa: SOpt?;
    sb: SOpt?;
}

contract OptOpt {
    m: MOpt?;

    init() {
        self.m = null;
    }
}
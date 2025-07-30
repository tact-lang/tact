struct EmptyOpt {
    s: String?;
}

contract OptDefaultComb {
    a: EmptyOpt?;
    b: Int = 9;
    c: Bool = true;

    init() {
        self.a = null;
    }
}
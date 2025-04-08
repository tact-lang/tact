struct S {
    a: Int;
    b: Bool;
}

contract OptStructOpt {
    opt_s: S?;

    init() {
        self.opt_s = null;
    }
}
struct S {
    f1: Int;
    f2: Bool;
}

contract TestContract {
    opt_s: S?;

    init() {
        self.opt_s = null;
    }
}
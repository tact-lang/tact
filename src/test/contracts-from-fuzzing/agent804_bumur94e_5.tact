struct Tiny {
    x: Int;
}

contract TestContract {
    opt: Tiny?;

    init() {
        self.opt = null;
    }
}

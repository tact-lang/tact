struct Sub {
    p: Int;
    q: Bool;
}

contract TestContract {
    opt: Sub?;
    init() {
        self.opt = null;
    }
}
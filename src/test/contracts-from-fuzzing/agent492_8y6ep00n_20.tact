struct Sub {
    s: String;
}

contract TestContract {
    opt: Sub?;

    init() {
        self.opt = null;
    }
}
struct Inner {
    str: String;
}

contract TestContract {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}
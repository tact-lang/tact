struct Inner {
    foo: Int = 7;
    bar: Bool = true;
}

contract Test {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}
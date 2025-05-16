struct Foo {
    opt: Int?;
}

contract TestContract {
    opt: Foo?;
    init() {
        self.opt = null;
    }
}
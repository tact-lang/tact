struct Foo {
    x: Int = 4;
    y: Bool = false;
}

contract TestContract {
    fooOpt: Foo?;

    init() {
        self.fooOpt = null;
    }
}
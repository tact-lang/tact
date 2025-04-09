struct Foo {
    x: Int = 5;
    y: Int?;
    z: String = "default";
}

contract TestContract {
    fooOpt: Foo?;

    init() {
        self.fooOpt = null;
    }
}
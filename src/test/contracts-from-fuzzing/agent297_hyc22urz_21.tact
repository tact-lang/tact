struct Foo {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: Foo?;

    init() {
        self.data = null;
    }
}
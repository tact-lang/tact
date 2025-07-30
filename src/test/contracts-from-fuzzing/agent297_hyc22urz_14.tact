struct Foo {
    a: Int = 1;
    b: Bool? = null;
    c: String = "hello";
}

contract TestContract {
    data: Foo;

    init() {
        self.data = Foo{}; // use defaults
    }
}
fun getVal(): Int { return 99; }

struct Foo {
    x: Int = getVal();
}

contract Test {
    f: Foo;

    init() {
        self.f = Foo{};
    }
}
struct Sub {
    foo: Int;
}

contract TestContract {
    a: Sub?;
    b: Sub?;
    c: Sub?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
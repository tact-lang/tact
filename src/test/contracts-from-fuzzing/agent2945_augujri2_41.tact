struct Wrapped {
    inner: Int;
}

contract MultiWrapped {
    a: Wrapped;
    b: Wrapped;
    c: Wrapped;

    init() {
        self.a = Wrapped{inner:1};
        self.b = Wrapped{inner:2};
        self.c = Wrapped{inner:3};
    }
}
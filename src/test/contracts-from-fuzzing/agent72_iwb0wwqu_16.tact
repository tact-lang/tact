struct Inner {
    nested: Int;
}

contract PersistMultipleOptionals {
    a: Int?;
    b: Inner?;
    c: Int?;
    d: Inner?;

    init() {
        self.a = null;
        self.b = Inner{ nested: 42 };
        self.c = 99;
        self.d = null;
    }
}
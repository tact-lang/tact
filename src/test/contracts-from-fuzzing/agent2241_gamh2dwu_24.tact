struct S {
    a: Int = 1;
    b: Int;
    c: Int = 2;
    d: Int;
}

contract InitStructMissingDefaults {
    x: S;

    init() {
        self.x = S{
            b: 10,
            d: 20
        };
    }
}
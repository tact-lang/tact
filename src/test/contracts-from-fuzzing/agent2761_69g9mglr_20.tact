struct S {
    foo: Int;
    bar: Bool = false;
    baz: Int?;
}

contract DefaultsAndOptionals {
    test: S;

    init() {
        self.test = S{
            foo: 123,
            // intentionally omit bar, uses default 'false'
            baz: null
        };
    }
}

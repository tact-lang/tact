struct SOpt {
    a: Int?;
    b: Int?;
}

contract TestContract {
    foo: SOpt?;

    init() {
        self.foo = SOpt{
            a: null,
            b: null,
        };
    }
}
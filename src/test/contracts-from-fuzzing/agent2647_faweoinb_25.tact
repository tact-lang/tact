struct SOpt {
    foo: Int?;
    bar: Bool?;
}

struct SOpt2 {
    baz: SOpt?;
    qux: Int;
}

contract OptNested2 {
    data: SOpt2;

    init() {
        self.data = SOpt2{
            baz: null,
            qux: 42
        };
    }
}
struct S1 {
    foo: Int;
}

struct S2 {
    bar: S1;
    baz: Int?;
}

contract ChainWithSomeOptions {
    data: S2;

    init() {
        self.data = S2{
            bar: S1{ foo: 42 },
            baz: null
        };
    }
}
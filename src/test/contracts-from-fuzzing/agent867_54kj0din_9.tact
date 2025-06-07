struct Inner {
    a: Int;
    b: Bool;
}

struct Container1 {
    inner: Inner;
    c: String;
}

struct Container2 {
    cont1: Container1;
    d: Bool;
}

contract TestContract {
    nested: Container2 = Container2{
        cont1: Container1{
            inner: Inner{ a: 1, b: true },
            c: "x"
        },
        d: false
    };

    init() {
        self.nested = Container2{
            cont1: Container1{
                inner: Inner{ a: 42, b: false },
                c: "y"
            },
            d: true
        };
    }
}

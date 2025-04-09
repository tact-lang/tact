struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    maybe: String?;
}

struct C {
    inner: B;
    note: String;
}

contract NestedMany {
    payload: C;
    init() {
        self.payload = C{
            inner: B{
                a: A{
                    x: 123456,
                    y: true
                },
                maybe: null
            },
            note: "hi"
        };
    }
}
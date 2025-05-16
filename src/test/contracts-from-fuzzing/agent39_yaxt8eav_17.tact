struct A {
    i: Int;
    s: String;
}

struct B {
    inner: A;
    optInner: A?;
    label: String;
}

contract MixedOptionalNested {
    data: B;

    init() {
        self.data = B{
            inner: A{ i: 1, s: "hello" },
            optInner: null,
            label: "lbl",
        };
    }
}
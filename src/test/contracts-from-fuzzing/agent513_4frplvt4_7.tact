struct Nested {
    foo: Int;
    deep: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    s: String;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{
            foo: 7,
            deep: Inner{
                a: 1,
                b: true,
                c: myAddress(),
                s: "ok"
            }
        };
    }

    receive() {}
}
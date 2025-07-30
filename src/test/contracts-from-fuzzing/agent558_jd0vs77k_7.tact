struct A {
    val: Int;
    flag: Bool?;
}

struct B {
    a: A;
    text: String;
}

struct C {
    inner: B;
    number: Int;
}

contract NestedDeep {
    deep: C;

    init() {
        self.deep = C{
            inner: B{
                a: A{
                    val: 1,
                    flag: true,
                },
                text: "deep",
            },
            number: 99,
        };
    }
}
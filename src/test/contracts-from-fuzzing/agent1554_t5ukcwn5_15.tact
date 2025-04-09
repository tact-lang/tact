struct A {
    a: Int;
    b: Bool;
}

struct B {
    inner: A;
    extra: String;
}

struct C {
    other: B;
    optional: Bool?;
}

contract MultiLevelStructs {
    s: C;

    init() {
        self.s = C{
            other: B{
                inner: A{
                    a: 5,
                    b: true,
                },
                extra: "z",
            },
            optional: null,
        };
    }
}
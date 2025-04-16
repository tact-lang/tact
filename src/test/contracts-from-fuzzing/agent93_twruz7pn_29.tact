struct A {
    x: Int as int8;
    y: Bool?;
    s: String;
}

struct B {
    aa: A;
    count: Int as uint64;
    flag: Bool;
}

struct C {
    bb: B;
    id: Int;
    label: String?;
}

contract ComplexPersist {
    val: C;

    init() {
        self.val = C{
            bb: B{
                aa: A{
                    x: -8,
                    y: true,
                    s: "hello",
                },
                count: 123456789,
                flag: false,
            },
            id: 99,
            label: null,
        };
    }
}
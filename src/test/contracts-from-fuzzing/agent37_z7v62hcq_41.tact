struct D {
    x: Int = 5;
    y: Bool?;
    z: String?;
}

struct C {
    d: D?;
    v: Int = 1;
}

struct B {
    c: C?;
    flag: Bool = false;
}

struct A {
    b: B?;
    note: String = "hi";
}

contract Test {
    data: A;
    init() {
        self.data = A{
            b: B{
                c: C{
                    d: null,
                    v: 123
                },
                flag: true
            },
            note: "ok"
        };
    }
}
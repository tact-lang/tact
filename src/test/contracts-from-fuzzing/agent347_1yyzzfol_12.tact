struct D {
    val: Int?;
    flag: Bool;
}

struct C {
    d: D;
    text: String?;
}

struct B {
    c: C;
    amount: Int;
}

struct A {
    b: B;
    status: Bool?;
}

contract DeepStorage {
    inner: A;

    init() {
        self.inner = A{
            b: B{
                c: C{
                    d: D{
                        val: 999,
                        flag: true
                    },
                    text:"deep"
                },
                amount: 123
            },
            status: false
        };
    }
}
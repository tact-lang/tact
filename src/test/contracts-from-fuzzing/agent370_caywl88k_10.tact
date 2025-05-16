struct A {
    val: Int;
}

struct B {
    a: A;
    opt: Int?;
}

struct C {
    inner: B;
    flag: Bool;
}

struct D {
    sub: C;
    txt: String;
}

contract DeepChain {
    f: D;

    init() {
        self.f = D{
            sub: C{
                inner: B{
                    a: A{val:99},
                    opt: null
                },
                flag: true
            },
            txt: "end"
        };
    }
}
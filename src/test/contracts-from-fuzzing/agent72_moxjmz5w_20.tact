struct A {
    val: Int;
}

struct B {
    next: A;
}

struct C {
    sub: B;
    flag: Bool;
}

struct D {
    inner: C;
    label: String;
}

contract ChainLayers {
    chain: D;

    init() {
        self.chain = D{
            inner: C{
                sub: B{
                    next: A{ val: 7 }
                },
                flag: true
            },
            label: "hey"
        };
    }
}
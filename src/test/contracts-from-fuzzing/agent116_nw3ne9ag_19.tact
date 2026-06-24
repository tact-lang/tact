contract DeepStructMsg {
    foo: A;

    init() {
        self.foo = A{
            b: B{
                c: C{ val: 77 },
                num: 100
            },
            z: 5
        };
    }
}

struct A {
    b: B;
    z: Int;
}

message B {
    c: C;
    num: Int;
}

struct C {
    val: Int;
}

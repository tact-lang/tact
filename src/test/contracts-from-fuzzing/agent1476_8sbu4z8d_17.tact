struct A {
    b: B;
    num: Int;
}

struct B {
    c: C;
    flag: Bool;
}

struct C {
    s: String;
    opt: Bool?;
}

contract DeepStructPersist {
    rec: A;

    init() {
        self.rec = A{
            num: 55,
            b: B{
                flag: true,
                c: C{
                    s: "ok",
                    opt: null,
                },
            },
        };
    }
}
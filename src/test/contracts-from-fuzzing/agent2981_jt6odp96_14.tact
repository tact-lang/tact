struct A {
    x: Int;
    y: Int;
    z: Bool;
}

struct B {
    s: String;
    n: A;
}

struct C {
    inner: B;
    flag: Bool;
}

contract MultiLayer {
    data: C;

    init() {
        self.data = C{
            inner: B{
                s: "abc",
                n: A{
                    x:1,
                    y:2,
                    z:true,
                },
            },
            flag: false,
        };
    }
}
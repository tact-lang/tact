struct A {
    a: Int;
    b: Bool;
    c: String;
}

struct B {
    d: A;
    e: Int;
}

struct C {
    f: B;
    g: Bool;
}

contract Bar {
    data: C;

    init() {
        self.data = C{
            f: B{
                d: A{a:1,b:true,c:"x"},
                e:3
            },
            g: false
        };
    }
    receive() {}
}
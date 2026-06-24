struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    a1: A;
    a2: A;
}

struct C {
    b1: B;
    flag: Bool;
}

contract TestContract {
    c: C;

    init() {
        self.c = C{
            b1: B{
                a1: A{foo:1, bar:true},
                a2: A{foo:2, bar:false},
            },
            flag: true
        };
    }

    receive() {}
}
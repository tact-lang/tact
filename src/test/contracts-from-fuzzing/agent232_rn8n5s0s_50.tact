struct A {
    i: Int;
}

struct B {
    a: A;
    b: Int;
}

struct C {
    b: B;
    c: Bool;
}

contract Chain {
    val: C;

    init() {
        self.val = C{
            b:B{
                a:A{ i:1 },
                b:2
            },
            c:true
        };
    }
}
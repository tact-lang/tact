struct A {
    a: Int;
}
struct B {
    b: Int;
}
struct C {
    a: A;
    b: B;
}

contract LongChain {
    value: C;

    init() {
        self.value = C{
            a: A{ a:1 },
            b: B{ b:2 }
        };
    }
}
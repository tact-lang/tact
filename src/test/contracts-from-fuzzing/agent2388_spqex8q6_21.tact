struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
    str: String;
}

contract ABStructs {
    bfield: B;

    init() {
        self.bfield = B{
            a1: A{x:1},
            a2: A{x:2},
            str: "hello"
        };
    }
}
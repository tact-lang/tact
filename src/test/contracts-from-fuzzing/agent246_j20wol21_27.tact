struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Container {
    a: A;
    b: B;
    c: C;
}

contract MultiStruct {
    storage: Container;

    init() {
        self.storage = Container{
            a: A{a:1},
            b: B{b:2},
            c: C{c:3},
        };
    }
}
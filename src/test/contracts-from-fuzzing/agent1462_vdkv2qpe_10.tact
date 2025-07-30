struct A { f1: Int; }
struct B { f2: Int; }
struct C { f3: Int; }

struct Container {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            a: A{f1:1},
            b: B{f2:2},
            c: C{f3:3}
        };
    }
}
struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

struct Container {
    sa: A;
    sb: B;
    sc: C;
}

contract NestContainers {
    data: Container;

    init() {
        self.data = Container{
            sa: A{a:1},
            sb: B{b:2},
            sc: C{c:3}
        };
    }
}
struct A {
    valA: Int;
}

struct B {
    valB: Int;
}

struct Container {
    a: A;
    b: B;
}

contract MultiStructContainer {
    storage: Container;

    init() {
        self.storage = Container{
            a: A{ valA: 11 },
            b: B{ valB: 22 }
        };
    }
}
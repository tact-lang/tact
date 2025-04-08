struct A {
    intVal: Int;
}

struct B {
    boolVal: Bool;
}

struct C {
    stringVal: String;
}

struct Container {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container {
            a: A { intVal: 3 },
            b: B { boolVal: true },
            c: C { stringVal: "hello" },
        };
    }
}
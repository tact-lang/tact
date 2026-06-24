struct A {
    x: Int = 1;
}

struct B {
    y: Int = 2;
    inner: A;
}

struct C {
    z: Int = 3;
    nested: B;
}

struct Container {
    one: C;
    two: C;
}

contract DoubleDeep {
    field: Container;

    init() {
        self.field = Container{
            one: C{z:10,nested:B{y:20,inner:A{x:30}}},
            two: C{z:11,nested:B{y:21,inner:A{x:31}}},
        };
    }
}

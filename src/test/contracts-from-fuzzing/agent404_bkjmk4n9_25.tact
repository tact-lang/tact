struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct AB {
    a: A;
    b: B;
}

struct Container {
    ab: AB;
    optAb: AB?;
}

contract NestedABs {
    data: Container;
    init() {
        self.data = Container{
            ab: AB{a: A{x:1}, b: B{y:2}},
            optAb: null
        };
    }
}
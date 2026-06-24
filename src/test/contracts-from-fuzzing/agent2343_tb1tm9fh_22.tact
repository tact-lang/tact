struct A {
    x: Int; 
}

struct B {
    y: Int;
}

struct Container {
    a: A?;
    b: B?;
}

contract MultiOptionalStructs {
    combined: Container;

    init() {
        self.combined = Container{
            a: null,
            b: null
        };
    }
}

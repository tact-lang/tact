struct A {
    foo: Int;
}

struct B {
    bar: A;        
}

struct C {
    baz: B;
}

contract DeepOptional {
    cOpt: C?;

    init() {
        self.cOpt = null;
    }
}
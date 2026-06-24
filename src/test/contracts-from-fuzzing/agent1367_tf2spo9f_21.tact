struct A {
    foo: Int;
}

struct B {
    bar: Int;
    nested: A;
}

struct C {
    baz: Int;
    inner: B;
}

contract Levels {
    v: C;
    
    init() {
        self.v = C{
            baz: 9,
            inner: B{
                bar: 8,
                nested: A{foo:7}
            }
        };
    }
}
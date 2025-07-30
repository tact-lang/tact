struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    baz: A;
    qux: Int;
}

struct C {
    nested: B;
    flag: Bool;
}

contract TestContract {
    cStruct: C;

    init() {
        self.cStruct = C{
            nested: B{
                baz: A{foo: 1, bar: false},
                qux: 42
            },
            flag: true
        };
    }
    
    receive() {
        let _ = self.cStruct.nested.baz.foo;
    }
}
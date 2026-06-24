contract NestedDefaultsOptionals {
    foo: A;

    init() {
        self.foo = A{
            val: 5,
            nested: B{
                cNested: C{
                    optVal: null,
                    y: 7
                },
                x: 3
            }
        };
    }
}

struct A {
    val: Int = 1;
    nested: B;
}

struct B {
    x: Int = 2;
    cNested: C;
}

struct C {
    optVal: Int? = null;
    y: Int = 6;
}

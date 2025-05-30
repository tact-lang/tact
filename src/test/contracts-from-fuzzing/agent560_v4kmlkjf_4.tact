struct A {
    val: Int;
}

struct B {
    foo: A;
}

struct C {
    bar: B;
}

contract DeepNest {
    deep: C;

    init() {
        self.deep = C{
            bar: B{
                foo: A{
                    val: 99
                }
            }
        };
    }
}
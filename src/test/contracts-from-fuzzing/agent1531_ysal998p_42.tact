struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

struct D {
    nest: C;
}

contract DeepStruct {
    val: D;

    init() {
        self.val = D{
            nest: C{
                baz: B{
                    bar: A{
                        foo:123
                    }
                }
            }
        };
    }
}

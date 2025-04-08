struct A {
    val: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract NestedMultipleOptionals {
    root: C;

    init() {
        self.root = C{
            b: B{
                a: A{
                    val: null
                }
            }
        };
    }
}
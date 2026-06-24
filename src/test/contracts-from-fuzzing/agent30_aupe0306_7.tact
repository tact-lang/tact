struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: Int?;
}

contract DeepNestedOptional {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: null
                }
            }
        };
    }
}
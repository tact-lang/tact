struct C {
    leaf: Int?;
}

struct B {
    inner: C;
}

struct A {
    inside: B;
}

contract NestedOptAssign {
    data: A;

    init() {
        self.data = A{
            inside: B{
                inner: C{
                    leaf: 777
                }
            }
        };
    }
}
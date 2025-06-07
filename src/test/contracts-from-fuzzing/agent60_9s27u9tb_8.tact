struct A {
    id: Int;
}

struct B {
    data: A;
}

struct C {
    data: B;
}

contract NestedOpt {
    info: C?;

    init() {
        self.info = C{
            data: B{
                data: A{ id: 100 }
            }
        };
    }
}
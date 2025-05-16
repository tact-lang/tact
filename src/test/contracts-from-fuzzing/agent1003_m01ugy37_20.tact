struct A {
    value: Int;
}

struct B {
    a: A?;
    value2: Int;
}

struct C {
    b: B?;
}

contract NestedOptionalsVariants {
    data: C;

    init() {
        self.data = C{
            b: B{
                a: null,
                value2: 55
            }
        };
    }
}
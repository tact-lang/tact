struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct NestedTuple {
    first: Int;
    second: C;
}

contract TupleAsStructStorage {
    data: NestedTuple;
    
    init() {
        self.data = NestedTuple{
            first: 5,
            second: C{ b: B{ a: A{ x: 7 } } }
        };
    }
}
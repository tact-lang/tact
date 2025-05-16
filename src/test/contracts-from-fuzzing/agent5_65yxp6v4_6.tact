struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

struct BigNest {
    s1: A;
    s2: B;
    s3: C;
}

contract NestedStructs {
    val: BigNest;
    init() {
        self.val = BigNest{
            s1: A{ a: 1 },
            s2: B{ b: 2 },
            s3: C{ c: 3 }
        };
    }
}
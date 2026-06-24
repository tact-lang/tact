struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct C {
    a: A;
    b: B;
}

contract MultipleNestedPaths {
    c: C;
    init() {
        self.c = C{
            a: A{ val: 1 },
            b: B{ val: 2 }
        };
    }
}
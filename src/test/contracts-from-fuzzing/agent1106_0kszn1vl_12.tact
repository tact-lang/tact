struct A {
    a: Int;
}
struct B {
    b: Int;
}
struct C {
    c: Int;
}

struct Outer {
    first: A; second: B; third: C;
}

contract ManyNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            first: A{ a: 1 },
            second: B{ b: 2 },
            third: C{ c: 3 },
        };
    }
}
struct C {
    x: Int;
    y: Int?;
}

struct B {
    c: C;
    flag: Bool;
}

struct A {
    b: B;
}

contract MultiNest {
    data: A;
    init() {
        self.data = A{
            b: B{
                c: C{ x: 5, y: null },
                flag: true
            }
        };
    }
}
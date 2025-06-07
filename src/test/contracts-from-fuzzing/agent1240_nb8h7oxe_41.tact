struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract ManyNestedStructs {
    data: C;
    init() {
        self.data = C{
            z:5,
            b: B{
                y:10,
                a: A{ x: 20 }
            }
        };
    }
}
struct A {
    i: Int;
}
struct B {
    j: Int;
    k: Int?;
}
struct C {
    x: A;
    y: B;
    z: Int;
}
contract ManyNest {
    f: C;
    init() {
        self.f = C{
            x: A{ i: 5 },
            y: B{ j: 6, k: null },
            z: 7
        };
    }
}
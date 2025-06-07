struct A {
    i: Int;
}
struct B {
    j: Int;
}
struct C {
    a: A;
    b: B;
}
contract Test {
    x: C;

    init() {
        self.x = C{
            a: A{i: 10},
            b: B{j: 20}
        };
    }
}
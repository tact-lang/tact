struct A {
    i: Int;
}
struct B {
    s: String;
}
struct C {
    b: Bool;
}
struct D {
    a: A;
    b: B;
    c: C;
}
contract TestContract {
    x: D;

    init() {
        self.x = D{
            a: A{i:1},
            b: B{s:"hi"},
            c: C{b:true}
        };
    }
}
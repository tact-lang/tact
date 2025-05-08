struct A { x: Int }
struct B { y: Bool }
struct C { z: String }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    f: Combo;

    init() {
        self.f = Combo{
            a: A{x:1},
            b: B{y:false},
            c: C{z:"hi"}
        };
    }
}
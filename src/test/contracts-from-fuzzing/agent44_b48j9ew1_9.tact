struct X1 { a: Int; }
struct X2 { b: X1; }
struct X3 { c: X2; }
struct X4 { d: X3; }
struct X5 { e: X4; }

contract MegaNested {
    val: X5;

    init() {
        self.val = X5{ e: X4{ d: X3{ c: X2{ b: X1{ a: 1 } } } } };
    }

    receive() {
        let _ = self.val.e.d.c.b.a;
    }
}
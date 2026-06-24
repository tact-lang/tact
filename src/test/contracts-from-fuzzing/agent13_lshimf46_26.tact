struct B { c: Int; }
struct A { b: B; }

contract TestNestedFieldAccess {
    receive() {
        // Testing nested field-access expressions
        let a: A = A { b: B { c: 42 } };
        let x: Int = a.b.c;
        dump(x); // Expected output: 42
    }
}

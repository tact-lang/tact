struct Example { a: Int; b: Int; }

contract TestFieldAccess {
    receive("plays") {
        let e: Example = Example { a: 10, b: 20 };
        dump(e.a);          // field access
        dump(e.b);
        dump(e.a + e.b);    // combined expression
    }
}

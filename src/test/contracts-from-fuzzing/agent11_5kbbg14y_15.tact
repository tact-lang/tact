contract TestComplexTernary {
    receive() {
        // Testing nested ternary chaining
        // Expected behavior: if true, returns 1; otherwise, if false returns 2; else 3.
        dump(true ? 1 : false ? 2 : 3);
    }
}

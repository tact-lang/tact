struct A {
    x: Int;
}

contract TestOptionalField {
    receive() {
        let a: A? = A { x: 123 };
        dump(a!!.x); // Expected output: 123
    }
}

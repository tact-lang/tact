contract TestCastingAndCoercion {
    receive() {
        // Testing type coercion using the extension function toString on an integer literal
        let s: String = 42.toString();
        dump(s); // Expected output: "42"
    }
}

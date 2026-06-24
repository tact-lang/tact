contract TestCastingAndCoercion {
    receive() {
        // Test casting and type coercion using extension functions
        let s: String = "42";
        // Convert string to slice and back to string
        let sliced: Slice = s.asSlice();
        let s2: String = sliced.asString();
        dump(s2); // expected output: "42"

        // Use casting-like chaining on an integer literal via toString()
        let numStr: String = 123.toString();
        dump(numStr); // expected output: "123"
    }
}

contract TestCastAndCoercion {
    receive() {
        // Testing type coercion and casting via non-null assert and extension function call
        let a: Int? = 42;
        let b: Int = a!!;           // non-null assertion to get Int from Int?
        let s: String = b.toString(); // converting Int to String using extension function
        dump(s);                    // Expected output: "42"
    }
}

contract TestBitwiseOperators {
    fun showcase() {
        let a = 5;
        // Expected results based on documentation:
        // -a        -> -5
        // ~a        -> -6 (bitwise NOT of 5)
        // -(~a)    -> 6
        // ~(-a)    -> 4
        dump(-a);     // expecting -5
        dump(~a);     // expecting -6
        dump(-(~a));  // expecting 6
        dump(~(-a));  // expecting 4
    }
}

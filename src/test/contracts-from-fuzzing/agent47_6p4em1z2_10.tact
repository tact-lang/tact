contract TestOptionalCoercionSuccess {
    receive() {
        // Implicitly coerce non-optional Int to an optional Int
        let a: Int = 5;
        let b: Int? = a;
        dump(b!!);  // Should dump 5
    }
}

contract TestOptionalExpr {
    receive() {
        // Declare an optional integer and force unwrap it using the non-null assertion !! operator
        let opt: Int? = 42;
        let unwrapped: Int = opt!!;
    }
}

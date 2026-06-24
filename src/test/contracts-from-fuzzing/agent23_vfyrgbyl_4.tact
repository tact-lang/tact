contract TestOptionalAssignment {
    receive() {
        let x: Int? = null;
        // This tests whether the compiler allows an explicit optional type.
    }
}
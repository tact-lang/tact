contract TestLetImmutability {
    receive() {
        let a: Int = 5;
        // Attempting to re-assign a let-bound variable should lead to a compile-time error
        a = 6;
    }
}

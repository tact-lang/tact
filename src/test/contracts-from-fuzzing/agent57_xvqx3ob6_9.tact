contract TestCast {
    receive() {
        // Testing casting and type coercion via method calls
        let s: String = 42.toString();
        let c: Cell = "Hello, Tact!".asComment();
    }
}

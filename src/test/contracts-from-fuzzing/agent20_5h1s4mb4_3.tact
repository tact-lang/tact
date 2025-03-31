contract Test {
    // specific text comment receiver
    receive("hello") {
        // dummy operation: use a local variable declared with let
        let x: Int = 1;
        let y: Int = x + 1;
    }
}

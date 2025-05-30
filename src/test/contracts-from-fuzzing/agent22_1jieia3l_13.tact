contract TestFunctionCallChainingValid {
    receive() {
        let s: String = 42.toString();
        let comment: Cell = "Hello, Tact!".asComment();
    }
}

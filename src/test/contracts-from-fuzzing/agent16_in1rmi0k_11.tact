contract TestLiteralMethod2 {
    receive() {
        let s: String = 42.toString();
        let comment: Cell = "Hello Tact!".asComment();
    }
}

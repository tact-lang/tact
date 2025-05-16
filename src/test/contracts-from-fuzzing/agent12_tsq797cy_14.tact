contract Test {
    receive() {
        let x: Int? = 420;
        let y: Int = x!!;
    }
}
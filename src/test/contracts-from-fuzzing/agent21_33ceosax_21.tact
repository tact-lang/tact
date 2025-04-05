contract Test {
    receive() {
        let x: Int? = null;
        let y: Int = x != null ? x!! : 15;
    }
}
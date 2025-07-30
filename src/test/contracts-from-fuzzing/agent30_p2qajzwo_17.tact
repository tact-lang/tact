contract TestCallChainFixed {
    receive() {
        // Chain call: Int literal -> toString() -> asComment()
        let comment: Cell = 42.toString().asComment();
        comment;
    }
}

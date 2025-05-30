trait T {
    abstract const X: Int;
}

contract Test with T {
    override const X: Int = 100;

    receive() {
        let x: Int = self.X;
    }
}

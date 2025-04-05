contract Test {
    const TEN: Int = 10;

    receive() {
        require(self.TEN == 10, "should be 10");
    }
}

contract BoolConstTest {
    const ACTIVE: Bool = 2 < 3;

    receive() {
        require(self.ACTIVE, "Should be active");
    }
}

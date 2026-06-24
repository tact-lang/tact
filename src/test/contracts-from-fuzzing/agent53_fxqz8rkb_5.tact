contract Test2 {
    const IS_ENABLED: Bool = true;

    receive() {
        if (self.IS_ENABLED) {
            // Do nothing
        } else {
            require(false, "should not occur");
        }
    }
}

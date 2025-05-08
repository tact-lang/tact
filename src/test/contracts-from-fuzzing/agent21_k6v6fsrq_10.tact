contract TestContract {
    const IS_ENABLED: Bool = true;

    receive() {
        if (self.IS_ENABLED) {
            // do nothing
        }
    }
}
